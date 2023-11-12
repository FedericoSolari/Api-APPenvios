require_relative './abstract_repository'

class RepositorioClientes < AbstractRepository
  self.table_name = :clientes
  self.model_class = 'Cliente'

  protected

  def load_object(a_hash)
    Cliente.new(a_hash[:nombre], a_hash[:direccion], a_hash[:codigo_postal])
  end

  def changeset(cliente)
    {
      nombre: cliente.nombre,
      direccion: cliente.direccion,
      codigo_postal: cliente.codigo_postal
    }
  end
end
