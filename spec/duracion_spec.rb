require_relative '../modelos/duracion'

describe 'Duracion' do
  it 'Duracion devuelve el tiempo en minutos correctamente' do
    duracion = Duracion.new(130)
    expect(duracion.minutos).to eq(3)
  end
end
