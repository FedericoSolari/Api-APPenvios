require 'active_model'
require_relative '../modelos/estados/asignado'
require_relative '../modelos/estados/entregado'
require_relative '../modelos/estados/en_camino'
require_relative '../modelos/estados/pendiente'

class FabricaEstados
  def crear_estado(estado)
    case estado
    when 'pendiente de asignacion'
      Pendiente.new
    when 'asignado'
      Asignado.new
    when 'en camino'
      EnCamino.new
    when 'entregado'
      Entregado.new
    end
  end
end
