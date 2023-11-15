Sequel.migration do
  up do
    alter_table :cadetes do
      set_column_type :id_cadete, 'bigint'
    end
  end

  down do
    alter_table :cadetes do
      set_column_type :id_cadete, 'integer'
    end
  end
end
