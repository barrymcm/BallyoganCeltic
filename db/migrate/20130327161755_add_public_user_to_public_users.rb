class AddPublicUserToPublicUsers < ActiveRecord::Migration
  def change
    add_column :public_users, :public_user, :boolean, :default => true
  end
end
