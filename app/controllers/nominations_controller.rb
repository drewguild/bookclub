class NominationsController < ApplicationController
    def index
        @books = NominationsQuery.new.all
    end

    def new; end

    def create
        NominateBook.new(member, params["title"], params["author"]).call
    end

    private

    #TODO: use current user member once there's users
    def member
        Member.first
    end
end