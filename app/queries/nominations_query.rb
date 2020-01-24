require "nominated_book"

class NominationsQuery
    attr_reader :relation

    def initialize(relation = Nomination.all)
        @relation = relation
    end

    def all
        nominated_books = relation.map do |nomination|
            NominatedBook.new(nomination, nomination.book)
        end

        nominated_books
    end
end