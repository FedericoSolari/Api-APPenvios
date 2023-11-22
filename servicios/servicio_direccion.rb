Dir[File.join(__dir__, 'persistencia', '*.rb')].each { |file| require file }

class ServicioDireccion
  def self.obtener_direccion(direccion, codigo_postal)
    direccion_encontrada = RepositorioDirecciones.new.find_by_address(direccion, codigo_postal)
    if direccion_encontrada.nil?
      direccion_encontrada = Direccion.new(direccion, codigo_postal)
      RepositorioDirecciones.new.save(direccion_encontrada)
    end
    direccion_encontrada
  end
end
