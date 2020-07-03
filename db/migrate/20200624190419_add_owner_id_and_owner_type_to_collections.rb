class AddOwnerIdAndOwnerTypeToCollections < ActiveRecord::Migration[5.1]
  def change
    add_column :collections, :owner_id, :integer
    add_column :collections, :owner_type, :string
  end
end
