class NominationsController < ApplicationController
    def index
        @books = NominationsQuery.new.all
    end

    def new; end

    def create
        NominateBook.new(member, params["title"], params["author"]).call

        redirect_to nominations_path
    end

    def destroy
        @id = RevokeNomination.new(nomination).call

        render "destroy.js.erb"
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

    def member
        current_user.member
    end

    def nomination
        Nomination.find(params["id"])
    end
end