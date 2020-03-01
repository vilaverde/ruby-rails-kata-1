module Utils
  class Main
    class << self
      def read_author_csv(csv)
        Authors::CsvBasedCreator.new(csv).create
      end

      def read_book_csv(csv)
        Books::CsvBasedCreator.new(csv).create
      end

      def read_magazine_csv(csv)
        Magazines::CsvBasedCreator.new(csv).create
      end

      def print_publications
        pp Publication.all
        nil
      end

      def find_by_isbn(isbn)
        pp Publication.find_by(isbn: isbn)
        nil
      end

      def find_by_author_email(email)
        pp Publication.joins(:authors).where(authors: {email: email})
        nil
      end

      def print_publications_by_title
        pp Publication.order(title: :asc)
        nil
      end
    end
  end
end
