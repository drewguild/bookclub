class BooksController < ApplicationController
  def add_read

  end

  def completed
    @books = current_club.collections.find_by(type: Collection::Types::READ).books
  end

  def create
    raise "No such collection type" unless Collection::Types::ALL.include?(params[:collection_type])
    collection = current_club.collections.find_by(type: params[:collection_type])

    book = Book.find_or_create_by!(title: params[:title], author: params[:author])
    Books::SynchronizeBook.new(book).call

    collection.books << book

    redirect_to :library
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