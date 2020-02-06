class RemoveUpvotesFromNominations < ActiveRecord::Migration[5.1]
  def up
    remove_column :nominations, :upvotes
  end

  def down
    add_column :nominations, :upvotes

    Nomination.find_each do |nomination|
      nomination.update_attribute(:upvotes, nomination.votes.count)
    end
  end
end
