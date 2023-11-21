require 'active_model'
require_relative '../modelos/estados/en_proceso'
require_relative '../modelos/estados/entregado'
require_relative '../modelos/estados/pendiente'

class FabricaEstados
  def crear_estado(estado)
    case estado
    when 'pendiente de asignacion'
      Pendiente.new
    when 'en proceso'
      EnProceso.new
    when 'entregado'
      Entregado.new
    end
  end
end
