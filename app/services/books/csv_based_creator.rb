module Books
  class CsvBasedCreator < Utils::ModelCsvBasedCreator
    def base_class
      Book
    end

    def fields
      Book.column_names | ['authors']
    end
  end
end
