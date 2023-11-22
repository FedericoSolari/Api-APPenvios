require_relative './abstract_repository'

class RepositorioDirecciones < AbstractRepository
  self.table_name = :direcciones
  self.model_class = 'Direccion'

  def find_by_id(id)
    direccion = dataset.where(id:).first
    load_object(direccion)
  end

  protected

  def load_object(a_hash)
    Direccion.new(a_hash[:direccion], a_hash[:codigo_postal], a_hash[:id], a_hash[:latitud], a_hash[:longitud])
  end

  def changeset(direccion)
    {
      direccion: direccion.direccion,
      codigo_postal: direccion.codigo_postal,
      latitud: direccion.latitud,
      longitud: direccion.longitud
    }
  end
end
