Sequel.migration do
  up do
    add_column :clientes, :id_cliente, Integer
  end

  down do
    drop_column :clientes, :id_cliente
  end
end
