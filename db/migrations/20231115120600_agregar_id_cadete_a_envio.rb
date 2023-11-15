Sequel.migration do
  up do
    add_column :envios, :id_cadete, Integer
  end

  down do
    drop_column :envios, :id_cadete
  end
end
