class ReviewsController < ApplicationController
  def index
    current_member
    @book = Book.find(params[:id])
  end

  def create
    @review = Books::Review.new(book_params).call

    render "create.js.erb"
  end

  private

  def book_params
    params.merge({
      book_id: params[:id],
      member_id: current_member.id
    })
  end
end