class NominateBook
    attr_reader :book, :member

    def initialize(member, title, author)
        @member = member
        @book = Book.new(title: title, author: author)
    end

    def call
        book.save!
        Nomination.create!(member: member, book: book)
    end
end