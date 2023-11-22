Sequel.migration do
  up do
    drop_column :clientes, :direccion
    drop_column :clientes, :codigo_postal
  end

  down do
    add_column :clientes, :direccion
    add_column :clientes, :codigo_postal
  end
end
