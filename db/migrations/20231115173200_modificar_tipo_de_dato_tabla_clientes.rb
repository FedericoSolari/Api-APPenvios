Sequel.migration do
  up do
    alter_table :clientes do
      set_column_type :id_cliente, 'bigint'
    end
  end

  down do
    alter_table :clientes do
      set_column_type :id_cliente, 'integer'
    end
  end
end
