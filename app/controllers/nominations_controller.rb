class NominationsController < ApplicationController
    def index
        @books = NominationsQuery.new.all
    end

    def new; end

    def create
        NominateBook.new(member, params["title"], params["author"]).call
    end

    def update
        nomination = UpvoteNomination.new(params["id"], current_user.member).call

        @book = NominatedBook.new(nomination, nomination.book)

        render "update.js.erb"
    end

    def downvote
        nomination = DownvoteNomination.new(params["id"], current_user.member).call

        @book = NominatedBook.new(nomination, nomination.book)

        render "update.js.erb"
    end

    private

    #TODO: use current user member once there's users
    def member
        Member.first
    end
end