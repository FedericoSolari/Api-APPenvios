Sequel.migration do
  up do
    alter_table :envios do
      set_column_type :id_cadete, 'bigint'
      set_column_type :id_cliente, 'bigint'
    end
  end

  down do
    alter_table :envios do
      set_column_type :id_cadete, 'integer'
      set_column_type :id_cliente, 'integer'
    end
  end
end
