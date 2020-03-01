module Authors
  class CsvBasedCreator < Utils::ModelCsvBasedCreator
    def base_class
      Author
    end
  end
end
