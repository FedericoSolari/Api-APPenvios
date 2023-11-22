require_relative '../../excepciones/parametros_invalidos_error'

class ValidadorParametros
  def validar_registro_cliente(parametros)
    if parametros['nombre'].nil? || parametros['direccion'].nil? || parametros['codigo_postal'].nil? || parametros['id_cliente'].nil?
      raise ParametrosInvalidosError, 'Verifique haber ingresado los datos necesarios, el formato correcto es: \<Nombre\>, \<Domicilio\> \<Altura\>, CP: \<codigo postal\>'
    end

    true
  end
end
