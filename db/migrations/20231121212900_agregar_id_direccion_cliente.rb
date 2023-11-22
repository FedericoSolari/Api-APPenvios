Sequel.migration do
  up do
    add_column :clientes, :id_direccion, Integer
  end

  down do
    drop_column :clientes, :id_direccion
  end
end
