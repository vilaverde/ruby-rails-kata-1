module Authors
  class CsvBasedCreator < Utils::ModelCsvBasedCreator
    def base_class
      Author
    end

    def fields
      Author.column_names
    end
  end
end
