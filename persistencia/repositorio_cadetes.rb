require_relative './abstract_repository'
require_relative '../fabricas/fabrica_vehiculos'
require_relative '../excepciones/cadete_no_encontrado_error'

class RepositorioCadetes < AbstractRepository
  self.table_name = :cadetes
  self.model_class = 'Cadete'

  def find_by_id(id_cadete)
    cadete = dataset.where(id_cadete:).order_append(Sequel.asc(:id)).last
    raise CadeteNoEncontradoError, 'No se encontró cadete registrado' if cadete.nil?

    load_object(cadete)
  end

  def find_by_name(nombre)
    cadete = dataset.where(nombre: nombre.downcase).first
    return nil if cadete.nil?

    load_object(cadete)
  end

  protected

  def load_object(a_hash)
    vehiculo = FabricaVehiculos.new.crear_vehiculo(a_hash[:vehiculo])
    Cadete.new(a_hash[:nombre], vehiculo, a_hash[:id_cadete], a_hash[:id])
  end

  def changeset(cadete)
    {
      nombre: cadete.nombre.downcase,
      vehiculo: cadete.vehiculo.vehiculo,
      id_cadete: cadete.id_cadete
    }
  end
end
