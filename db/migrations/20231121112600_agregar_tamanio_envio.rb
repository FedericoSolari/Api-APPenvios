Sequel.migration do
  up do
    add_column :envios, :tamanio, String
  end

  down do
    drop_column :envios, :tamanio
  end
end
