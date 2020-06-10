class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.integer :club_id
      t.string :type
      t.string :label
    end
  end
end
