require_relative './abstract_repository'

class RepositorioClientes < AbstractRepository
  self.table_name = :clientes
  self.model_class = 'Cliente'

  def find_by_id(id_cliente)
    cliente = dataset.where(id_cliente:).first
    load_object(cliente)
  end

  protected

  def load_object(a_hash)
    Cliente.new(a_hash[:nombre], a_hash[:direccion], a_hash[:codigo_postal], a_hash[:id_cliente], a_hash[:id])
  end

  def changeset(cliente)
    {
      nombre: cliente.nombre,
      direccion: cliente.direccion.direccion,
      codigo_postal: cliente.direccion.codigo_postal,
      id_cliente: cliente.id_cliente
    }
  end
end
