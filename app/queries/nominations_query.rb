class NominationsQuery
    attr_reader :relation

    def initialize(relation = Nomination.all)
        @relation = relation
    end

    def all
        Book.where(id: relation.pluck(:book_id))
    end

    def for_club(club)
        Book.where(id: relation.where(member_id: club.members.ids).pluck(:book_id))
    end
end