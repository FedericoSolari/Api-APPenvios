Dado('que tengo {string}') do |string|
  @cadete.vehiculo = string
  RepositorioCadetes.new.save(@cadete)
  @envio.cadete.vehiculo = string
  RepositorioEnvios.new.save(@envio)
end

Dado('que el envio es de tamanio {string}') do |string|
  @envio.tamanio = FabricaTamanios.new.crear_tamanio(string)
  RepositorioEnvios.new.save(@envio)
end
