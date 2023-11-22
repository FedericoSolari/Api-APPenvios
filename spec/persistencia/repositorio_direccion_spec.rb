require 'integration_helper'
require_relative '../../modelos/direccion'

describe 'RepositorioDirecciones' do
  xit 'deberia guardar y asignar id a la direccion' do
    direccion = Direccion.new('Av Las Heras 1232', 'CP: 1018')
    RepositorioDirecciones.new.save(direccion)
    expect(direccion.id).not_to be_nil
  end

  xit 'deberia encontrar el registro segun el id de la direccion' do
    direccion = Direccion.new('Av Las Heras 1232', 'CP: 1018')
    repositorio = RepositorioDirecciones.new
    repositorio.save(direccion)
    expect(repositorio.find_by_id(direccion.id)).not_to be_nil
  end
end
