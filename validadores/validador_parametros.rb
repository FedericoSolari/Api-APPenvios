require_relative '../excepciones/parametros_invalidos_error'

class ValidadorParametros
  VEHICULOS_VALIDOS = %w[moto auto bicicleta].freeze

  def validar_registro_cliente(parametros)
    if parametros['nombre'].nil? || parametros['direccion'].nil? || parametros['codigo_postal'].nil? || parametros['id_cliente'].nil?
      raise ParametrosInvalidosError, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Nombre\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>'
    end

    true
  end

  def validar_registro_cadete(parametros)
    if parametros['nombre'].nil? || parametros['vehiculo'].nil? || parametros['id_cadete'].nil?
      raise ParametrosInvalidosError,
            'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Nombre\>, \<Vehículo\>'
    end

    true
  end

  def validar_creacion_envio(parametros)
    if parametros['tamanio'].nil? || parametros['direccion'].nil? || parametros['codigo_postal'].nil? || parametros['id_cliente'].nil? || parametros['tipo'].nil?
      raise ParametrosInvalidosError, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Tipo\>, \<Tamaño\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>'
    end

    true
  end

  def validar_vehiculo(vehiculo)
    unless VEHICULOS_VALIDOS.include?(vehiculo.downcase)
      raise ParametrosInvalidosError,
            'Nuestra flota no acepta ese tipo de vehiculo, los vehiculos permitidos son *auto*, *moto* o *bicicleta*.'
    end

    true
  end
end
