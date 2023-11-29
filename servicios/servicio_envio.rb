Dir[File.join(__dir__, 'persistencia', '*.rb')].each { |file| require file }
require_relative '../excepciones/envios_no_encontrados_error'
require_relative './servicio_direccion'
require_relative '../fabricas/fabrica_de_tipos'

class ServicioEnvio
  def self.agregar_envio(parametros_envio)
    tipo_de_envio = FabricaTipoEnvios.new.crear_tipo_de_envio(parametros_envio['tipo'])
    direccion = ServicioDireccion.obtener_direccion(parametros_envio['direccion'], parametros_envio['codigo_postal'])
    envio = Envio.new(FabricaTamanios.new.crear_tamanio(parametros_envio['tamanio']), direccion,
                      RepositorioClientes.new.find_last_created_with_id(parametros_envio['id_cliente']), tipo_de_envio)
    RepositorioEnvios.new.save(envio)
    envio
  end

  def self.asignar_envio(parametros_envio)
    cadete = RepositorioCadetes.new.find_by_id(parametros_envio['id_cadete'])
    tamanios_permitidos = cadete.tamanios_aceptados
    begin
      envio = RepositorioEnvios.new.find_with_filter('pendiente de asignacion', tamanios_permitidos, 'express')
    rescue EnvioNoEncontradoError
      envio = RepositorioEnvios.new.find_with_filter('pendiente de asignacion', tamanios_permitidos, 'clasico')
    end
    envio.cadete = cadete
    envio.estado = envio.estado.cambiar_a_estado(FabricaEstados.new.crear_estado('asignado'))
    envio
  end

  def self.consultar_estado(parametros_envio, id_solicitante)
    envio = RepositorioEnvios.new.find(parametros_envio['id'])
    solicitante = RepositorioClientes.new.find_last_created_with_id(id_solicitante)
    if envio.cliente.nombre == solicitante.nombre
      estado = ParseadorEstado.new.obtener_mensaje(envio)
    else
      raise ParametrosInvalidosError, 'No tenes envios asociados con ese ID'
    end
    estado
  end

  def self.mensaje_confirmacion(id_envio)
    envio = RepositorioEnvios.new.find(id_envio)
    if envio.estado.estado == 'en camino'
      'Gracias por retirar el envio!'
    else
      'Gracias por entregar el envio!'
    end
  end

  def self.actualizar_estado(id_envio, estado)
    envio = RepositorioEnvios.new.find(id_envio)
    envio.estado = envio.estado.cambiar_a_estado(FabricaEstados.new.crear_estado(estado))
    RepositorioEnvios.new.save(envio)
    envio
  end

  def self.historial_de_envios(id_cliente)
    cliente = RepositorioClientes.new.find_last_created_with_id(id_cliente)
    envios = RepositorioEnvios.new.client_record(cliente.nombre)

    formatear_historial(envios)
  end

  def self.formatear_historial(envios)
    historial = []
    envios.each do |e|
      informacion_envio = { 'text': "Envio: *ID #{e.id}*, \nTamaño: *#{e.tamanio.tamanio}*, \n" \
      "Direccion destino: *#{e.direccion.direccion}*, \n" \
       "Cadete asignado: *#{e.cadete.nil? ? '-' : e.cadete.nombre}*, \nEstado: *#{e.estado.estado}*, \n" \
        "Tipo: *#{e.tipo.tipo}*" }
      historial << informacion_envio
    end
    historial
  end
end
