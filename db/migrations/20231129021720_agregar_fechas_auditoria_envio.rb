Sequel.migration do
  up do
    add_column :envios, :fecha_creacion, Date
    add_column :envios, :fecha_actualizacion, Date
  end

  down do
    drop_column :envios, :fecha_creacion
    drop_column :envios, :fecha_actualizacion
  end
end
