Sequel.migration do
  up do
    add_column :direcciones, :fecha_creacion, Date
    add_column :direcciones, :fecha_actualizacion, Date
  end

  down do
    drop_column :direcciones, :fecha_creacion
    drop_column :direcciones, :fecha_actualizacion
  end
end
