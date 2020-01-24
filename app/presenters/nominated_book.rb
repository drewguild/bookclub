class NominatedBook
    attr_reader :book, :nomination

    def initialize(nomination, book)
        @book = book
        @nomination = nomination
    end

    def author
        book.author
    end

    def title
        book.title
    end

    def upvotes
        nomination.upvotes
    end
end