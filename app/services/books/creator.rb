module Books
  class Creator
    def initialize(params)
      @params = params
    end

    def call
      @raise_error = false
      process_books
    end

    def call!
      @raise_error = true
      process_books
    end

    private

    def process_books
      return create_books if @params.is_a?(Array)

      create_book
    end

    def create_books
      ActiveRecord::Base.transaction do
        @params.map do |book|
          book_data = book
          book_data['authors'] = Author.where(email: book['authors'])

          create_book(book_data)
        end
      end
    end

    def create_book(data = @params)
      book = Book.new(data)

      if !book.valid? && @raise_error
        raise(CustomErrors::ModelError,
              I18n.t(:model_error,
                     scope: :errors,
                     model_name: 'Book',
                     data: data.to_s,
                     message: book.errors.full_messages.to_s))
      end

      book.tap { |a| a.save }
    end
  end
end
