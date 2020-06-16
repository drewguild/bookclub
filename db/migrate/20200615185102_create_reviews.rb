class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :text
      t.integer :score
      t.integer :book_id
      t.integer :member_id
    end
  end
end
