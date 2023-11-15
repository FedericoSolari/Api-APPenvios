require_relative './abstract_repository'

class RepositorioCadetes < AbstractRepository
  self.table_name = :cadetes
  self.model_class = 'Cadete'

  protected

  def load_object(a_hash)
    Cadete.new(a_hash[:nombre], a_hash[:vehiculo], a_hash[:id_cadete], a_hash[:id])
  end

  def changeset(cadete)
    {
      nombre: cadete.nombre,
      vehiculo: cadete.vehiculo,
      id_cadete: cadete.id_cadete
    }
  end
end
