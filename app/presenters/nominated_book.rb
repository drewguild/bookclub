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
        nomination.votes.size
    end

    def upvoted_by?(user)
        nomination.votes.map(&:member).include?(user.member)
    end

    def to_partial_path
        'nominated_books/nominated_book'
    end
end