Sequel.migration do
  up do
    add_column :envios, :tipo, String
  end

  down do
    drop_column :envios, :tipo
  end
end
