class ChangeUsersMemberIdToInteger < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :member_id_integer, :integer

    User.find_each do |user|
      user.update_attribute(:member_id_integer, user.member_id.to_i)
    end

    remove_column :users, :member_id
    rename_column :users, :member_id_integer, :member_id
  end

  def down
    add_column :users, :member_id_string, :string

    User.find_each do |user|
      user.update_attribute(:member_id_string, user.member_id.to_s)
    end

    remove_column :users, :member_id
    rename_column :users, :member_id_string, :member_id

  end
end
