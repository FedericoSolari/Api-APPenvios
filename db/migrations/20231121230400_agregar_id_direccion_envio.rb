Sequel.migration do
  up do
    add_column :envios, :id_direccion, Integer
  end

  down do
    drop_column :envios, :id_direccion
  end
end
