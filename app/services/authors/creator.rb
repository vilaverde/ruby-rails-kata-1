module Authors
  class Creator
    def initialize(params)
      @params = params
    end

    def call
      return create_authors if @params.is_a?(Array)

      create_author
    end

    private

    def create_authors
      ActiveRecord::Base.transaction do
        @params.map { |author| create_author(author) }
      end
    end

    def create_author(data = @params)
      author = Author.new(data)
      return author.tap { |a| a.save } if author.valid?

      raise(CustomErrors::ModelError,
            I18n.t(:model_error,
                   scope: :errors,
                   model_name: 'Author',
                   data: data.to_s,
                   message: author.errors.full_messages.to_s))
    end
  end
end
