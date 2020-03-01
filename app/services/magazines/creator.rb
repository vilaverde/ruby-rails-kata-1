module Magazines
  class Creator
    def initialize(params)
      @params = params
    end

    def call
      return create_magazines if @params.is_a?(Array)

      create_magazine
    end

    private

    def create_magazines
      ActiveRecord::Base.transaction do
        @params.map do |magazine|
          magazine_data = magazine
          magazine_data['authors'] = Author.where(email: magazine['authors'])

          create_magazine(magazine_data)
        end
      end
    end

    def create_magazine(data = @params)
      magazine = Magazine.new(data)
      return magazine.tap { |a| a.save } if magazine.valid?

      raise(CustomErrors::ModelError,
            I18n.t(:model_error,
                   scope: :errors,
                   model_name: 'Magazine',
                   data: data.to_s,
                   message: magazine.errors.full_messages.to_s))
    end
  end
end
