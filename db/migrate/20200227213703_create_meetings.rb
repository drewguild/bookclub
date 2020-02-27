class CreateMeetings < ActiveRecord::Migration[5.1]
  def change
    create_table :meetings do |t|
      t.date    :held_on
      t.integer :club_id
      t.date    :selection_deadline

      t.timestamps
    end
  end
end
