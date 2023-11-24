require 'spec_helper'
require_relative '../servicios/servicio_usuarios'

describe 'Servicios' do
  describe 'ServicioUsuarios' do
    describe 'cliente valido?' do
      it 'Se crea exitosamente un cliente al ingresar todos los datos correctamente' do
        parametros_cliente = { 'nombre' => 'juan', 'direccion' => 'Av Las Heras 1232', 'codigo_postal' => 'CP: 1018', 'id_cliente' => 8 }
        cliente = ServicioUsuarios.agregar_cliente(parametros_cliente)

        expect(cliente.valid?).to eq true
      end
    end
  end
end
