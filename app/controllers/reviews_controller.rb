class ReviewsController < ApplicationController
  def index
    @book = Book.find(params[:id])
  end
end