class CollectionsController < ApplicationController
  def new_book
    @collection = Collection.find(params[:id])
  end

  def add
    raise "No such collection type" unless Collection::Types::ALL.include?(params[:collection_type])
    params.require([:author, :title])

    Collections::AddBook.new(params_with_owner).call
  end

  private

  def params_with_owner
    params.merge({ owner: current_entity })
  end

  def current_entity
    {
      Club.name => current_club,
      Member.name => current_member
    }[params[:owner_type]]
  end
end