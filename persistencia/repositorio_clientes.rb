require_relative './abstract_repository'

class RepositorioClientes < AbstractRepository
  self.table_name = :clientes
  self.model_class = 'Cliente'

  def find_by_id(id_cliente)
    cliente = dataset.where(id_cliente:).first
    return nil if cliente.nil?

    load_object(cliente)
  end

  protected

  def load_object(a_hash)
    direccion = RepositorioDirecciones.new.find_by_id(a_hash[:id_direccion])
    Cliente.new(a_hash[:nombre], direccion, a_hash[:id_cliente], a_hash[:id])
  end

  def changeset(cliente)
    {
      nombre: cliente.nombre,
      id_direccion: cliente.direccion.id,
      id_cliente: cliente.id_cliente
    }
  end
end
