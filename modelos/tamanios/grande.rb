require_relative './tamanio'

class Grande < Tamanio
  TAMANIO = 'grande'.freeze
  def initialize
    super(TAMANIO)
  end
end
