class Duracion
  SEGUNDOS_POR_MINUTO = 60.0
  def initialize(tiempo_en_segundos)
    @tiempo = tiempo_en_segundos
  end

  def minutos
    (@tiempo / SEGUNDOS_POR_MINUTO).ceil
  end
end
