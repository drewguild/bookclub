class NominationsQuery
    attr_reader :relation

    def initialize(relation = Nomination.all)
        @relation = relation
    end

    def for_club(club)
        Book.where(relation.where(member_id: club.members).pluck(:book_id))
    end
end