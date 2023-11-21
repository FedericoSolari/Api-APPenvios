require_relative './tamanio'

class Mediano < Tamanio
  TAMANIO = 'mediano'.freeze
  def initialize
    super(TAMANIO)
  end
end
