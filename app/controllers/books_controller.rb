class BooksController < ApplicationController
  def completed

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