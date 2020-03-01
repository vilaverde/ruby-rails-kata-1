module Magazines
  class CsvBasedCreator < Utils::ModelCsvBasedCreator
    def base_class
      Magazine
    end

    def fields
      Magazine.column_names | ['authors']
    end
  end
end
