class ReviewsController < ApplicationController
  def index
    current_member
    @book = Book.find(params[:id])
  end

  def create
    @review = Books::Review.new(book_params).call

    render "create.js.erb"
  end

  def destroy
    @review = Review.find_by!(book_id: params[:id], member_id: current_member.id).destroy!

    render "destroy.js.erb"
  end

  def edit
    @review = Review.find_by(
      book_id: params[:id], 
      member_id: current_member.id
    )
    
    @review.update_attributes!(editable_params)
    @review.reload

    render "edit.js.erb"
  end

  private

  def book_params
    params.merge({
      book_id: params[:id],
      member_id: current_member.id
    })
  end

  def editable_params
    params.slice(:text).permit!
  end
end