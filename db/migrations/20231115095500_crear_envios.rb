Sequel.migration do
  up do
    create_table(:envios) do
      primary_key :id
      String :direccion
      String :codigo_postal
      Numeric :id_cliente
    end
  end

  down do
    drop_table(:envios)
  end
end
