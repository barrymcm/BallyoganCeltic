class ChangePubliusersSaltToLimit64 < ActiveRecord::Migration
  def up
    change_column :public_users, :salt, :string, :limit => 64
  end

  def down
    change_column :public_users, :salt, :string
  end
end
