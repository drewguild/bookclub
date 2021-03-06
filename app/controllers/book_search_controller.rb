class BookSearchController < ApplicationController
  def index
    @book_search_results = Books::Search.new(search_params).call
    # TODO: this template only makes sense in context of nominations page currently. 
    #  Once Nominations are a Collection it can be genericized
    render "index.js.erb"

    rescue StandardError => e
      render "error.js.erb"
  end

  private

  def search_params
    params.slice(:author, :title)
  end
end