Sequel.migration do
  up do
    add_column :clientes, :fecha_creacion, Date
    add_column :clientes, :fecha_actualizacion, Date
  end

  down do
    drop_column :clientes, :fecha_creacion
    drop_column :clientes, :fecha_actualizacion
  end
end
