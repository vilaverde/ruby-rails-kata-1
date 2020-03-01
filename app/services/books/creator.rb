module Books
  class Creator
    def initialize(params)
      @params = params
    end

    def call
      return create_books if @params.is_a?(Array)

      create_book
    end

    private

    def create_books
      ActiveRecord::Base.transaction do
        @params.map do |book|
          book_data = book
          byebug
          book_data['authors'] = Author.where(email: book['authors'])

          create_book(book_data)
        end
      end
    end

    def create_book(data = @params)
      book = Book.new(data)
      return book.tap { |a| a.save } if book.valid?

      raise(CustomErrors::ModelError,
            I18n.t(:model_error,
                   scope: :errors,
                   model_name: 'Book',
                   data: data.to_s,
                   message: book.errors.full_messages.to_s))
    end
  end
end
