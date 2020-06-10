class BooksController < ApplicationController
  def completed
    @books = current_club.collections.find_by(type: Collection::Types::READ).books
  end

  def mark_read
    Books::ReadNomination.new(params_with_club).call
  end

  private

  def params_with_club
    params.merge({
      book_id: params[:id],
      club: current_club
    })
  end
end