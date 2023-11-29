Dado('que el cadete tiene el vehiculo {string}') do |string|
  @cadete.vehiculo = FabricaVehiculos.new.crear_vehiculo(string)
  RepositorioCadetes.new.save(@cadete)
  @envio.cadete.vehiculo = FabricaVehiculos.new.crear_vehiculo(string)
  RepositorioEnvios.new.save(@envio)
end
