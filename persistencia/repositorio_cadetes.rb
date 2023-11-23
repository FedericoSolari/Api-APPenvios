require_relative './abstract_repository'

class RepositorioCadetes < AbstractRepository
  self.table_name = :cadetes
  self.model_class = 'Cadete'

  def find_by_id(id_cadete)
    cadete = dataset.where(id_cadete:).first
    return nil if cadete.nil?

    load_object(cadete)
  end

  def find_by_name(nombre)
    cadete = dataset.where(nombre: nombre.downcase).first
    return nil if cadete.nil?

    load_object(cadete)
  end

  protected

  def load_object(a_hash)
    Cadete.new(a_hash[:nombre], a_hash[:vehiculo], a_hash[:id_cadete], a_hash[:id])
  end

  def changeset(cadete)
    {
      nombre: cadete.nombre.downcase,
      vehiculo: cadete.vehiculo,
      id_cadete: cadete.id_cadete
    }
  end
end
