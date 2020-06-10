class AddThumbnailToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :thumbnail, :string
  end
end
