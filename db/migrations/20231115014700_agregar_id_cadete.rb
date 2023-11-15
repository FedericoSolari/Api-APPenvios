Sequel.migration do
  up do
    add_column :cadetes, :id_cadete, Integer
  end

  down do
    drop_column :cadetes, :id_cadete
  end
end
