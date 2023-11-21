require_relative './tamanio'

class Chico < Tamanio
  TAMANIO = 'chico'.freeze
  def initialize
    super(TAMANIO)
  end
end
