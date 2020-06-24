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

    def all_for_club(club)
      relation.where(member_id: Member.where(club_id: club.id).ids).map do |nomination|
        NominatedBook.new(nomination, nomination.book)
      end
    end
end