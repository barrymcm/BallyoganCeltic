class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :first_name,       :limit => 25
      t.string :last_name,        :limit => 25
      t.string :position,         :limit => 25
      t.string :email,            :limit => 25, :null => false
      t.string :hashed_password,  :limit => 64
      t.string :username,         :limit => 25
      t.string :salt,             :limit => 25
      t.integer :phone
      t.string :image

      t.timestamps
    end
  end
end
