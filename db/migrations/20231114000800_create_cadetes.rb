Sequel.migration do
  up do
    create_table(:cadetes) do
      primary_key :id
      String :nombre
      String :vehiculo
    end
  end

  down do
    drop_table(:cadetes)
  end
end
