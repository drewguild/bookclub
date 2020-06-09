class AddBookIdToMeetings < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :book_id, :integer
  end
end
