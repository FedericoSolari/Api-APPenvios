Dado('que el cadete tiene el vehiculo {string}') do |string|
  @cadete.vehiculo = string
  RepositorioCadetes.new.save(@cadete)
  @envio.cadete.vehiculo = string
  RepositorioEnvios.new.save(@envio)
end
