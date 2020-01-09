class CreateNominations < ActiveRecord::Migration[5.1]
  def change
    create_table :nominations do |t|
      t.integer :upvotes
      t.integer :book_id
      t.integer :member_id

      t.timestamps
    end
  end
end
