Sequel.migration do
  up do
    add_column :envios, :duenio, String
  end

  down do
    drop_column :envios, :duenio
  end
end
