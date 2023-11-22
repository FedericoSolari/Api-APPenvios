Sequel.migration do
  up do
    drop_column :envios, :direccion
    drop_column :envios, :codigo_postal
  end

  down do
    add_column :envios, :direccion
    add_column :envios, :codigo_postal
  end
end
