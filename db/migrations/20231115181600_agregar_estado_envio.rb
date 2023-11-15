Sequel.migration do
  up do
    add_column :envios, :estado, String
  end

  down do
    drop_column :envios, :estado
  end
end
