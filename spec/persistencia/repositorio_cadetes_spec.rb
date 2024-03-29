require 'integration_helper'
require_relative '../../modelos/cadete'
require_relative '../../persistencia/repositorio_cadetes'
require_relative '../../modelos/vehiculos/moto'
require_relative '../../modelos/vehiculos/auto'

describe RepositorioCadetes do
  it 'deberia guardar y asignar id al cliente' do
    pedro = Cadete.new('Pedro', Auto.new, 8)
    described_class.new.save(pedro)
    expect(pedro.id).not_to be_nil
  end

  it 'deberia encontrar el registro segun el id del cadete' do
    juan = Cadete.new('Juan', Moto.new, 8)
    repositorio = described_class.new
    repositorio.save(juan)
    expect(repositorio.find_by_id(juan.id_cadete)).not_to be_nil
  end

  it 'debería encontrar el registro según el nombre del cadete' do
    juan = Cadete.new('Juan', Moto.new, 8)
    repositorio = described_class.new
    repositorio.save(juan)
    expect(repositorio.find_by_name(juan.nombre)).not_to be_nil
  end
end
