module Books
  class ReadNomination

    attr_reader :book_id, :club
    def initialize(options)
      @book_id = options[:book_id]
      @club = options[:club]
    end

    def call
      collection = club.collections.find_by(type: Collection::Types::READ)
      collection.books << Book.find(book_id)

      Nomination.find_by(book_id: book_id).destroy!
    end
  end
end