class ChangeAdminusersSaltToLimit64 < ActiveRecord::Migration
  def up
    change_column :admin_users, :salt, :string, :limit => 64
  end

  def down
    change_column :admin_users, :salt
  end
end
