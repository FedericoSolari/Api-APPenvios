Sequel.migration do
  up do
    create_table(:clientes) do
      primary_key :id
      String :nombre
      String :direccion
      String :codigo_postal
    end
  end

  down do
    drop_table(:clientes)
  end
end
