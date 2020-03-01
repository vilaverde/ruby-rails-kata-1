module Utils
  require 'csv'

  class ModelCsvBasedCreator
    def initialize(csv_file)
      @csv_file = csv_file
    end

    def create
      process_csv
    end

    private

    def base_class
      raise(NotImplemented)
    end

    def fields
      raise(NotImplemented)
    end

    def process_csv
      @csv_data = CSV.read(@csv_file, col_sep: ';')

      @csv_fields = @csv_data.shift.split(';').flatten
      validate_fields

      creator_class = "#{base_class.to_s.pluralize}::Creator".constantize
      creator_class.new(format_csv_data).call
    end

    def validate_fields
      aux_fields = @csv_fields.dup

      fields.each do |column|
        aux_fields.delete(column.to_s.underscore)
      end

      return if aux_fields.empty?

      raise(CustomErrors::CsvReadError, I18n.t(:csv_read_error,
                                               scope: :errors,
                                               base_class: base_class.to_s))
    end

    def format_csv_data
      @csv_data.each_with_object([]) do |row, obj|
        row_data = {}
        row.each_with_index do |value, index|
          row_data[@csv_fields[index]] = value
        end

        obj << row_data
      end
    end
  end
end
