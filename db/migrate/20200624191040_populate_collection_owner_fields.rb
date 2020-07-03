class PopulateCollectionOwnerFields < ActiveRecord::Migration[5.1]
  def up
    Collection.where.not(club_id: nil).each do |collection|
      collection.owner_id = collection.club_id
      collection.owner_type = Club.name
      collection.save!
    end
  end

  def down
    Collection.where(owner_type: Club.name).each do |collection|
      collection.owner_id = nil 
      collection.owner_type = nil
      collection.save!
    end
  end
end
