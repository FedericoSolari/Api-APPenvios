Sequel.migration do
  up do
    create_table(:direcciones) do
      primary_key :id
      String :direccion
      String :codigo_postal
      String :latitud
      String :longitud
    end
  end

  down do
    drop_table(:direcciones)
  end
end
