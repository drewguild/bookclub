class CreateJoinTableCollectionBook < ActiveRecord::Migration[5.1]
  def change
    create_join_table :collections, :books 
  end
end
