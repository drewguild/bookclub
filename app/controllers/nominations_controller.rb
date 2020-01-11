class NominationsController < ApplicationController
    def index
        @books = NominationsQuery.new.all
    end
end