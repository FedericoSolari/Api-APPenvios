Sequel.migration do
  up do
    add_column :cadetes, :fecha_creacion, Date
    add_column :cadetes, :fecha_actualizacion, Date
  end

  down do
    drop_column :cadetes, :fecha_creacion
    drop_column :cadetes, :fecha_actualizacion
  end
end
