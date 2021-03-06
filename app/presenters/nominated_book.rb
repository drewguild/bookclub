class NominatedBook
    attr_reader :book, :nomination

    def initialize(nomination, book)
        @book = book
        @nomination = nomination
    end

    def author
        book.author
    end

    def id 
      book.id
    end

    def title
        book.title
    end

    def description
        book.description || "No description available"
    end

    def upvotes
        nomination.votes.size
    end

    def nominated_by?(user)
        !!(nomination.member_id == user.member_id)
    end

    def upvoted_by?(user)
        nomination.votes.map(&:member).include?(user.member)
    end

    def to_partial_path
        'nominated_books/nominated_book'
    end
end