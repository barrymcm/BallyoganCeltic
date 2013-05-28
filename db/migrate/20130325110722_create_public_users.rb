class CreatePublicUsers < ActiveRecord::Migration
  def change
    create_table :public_users do |t|
      t.string :first_name,       :limit => 25
      t.string :last_name,        :limit => 25
      t.string :email,            :limit => 55, :null => false
      t.string :hashed_password,  :limit => 64
      t.string :username,         :limit => 25
      t.string :salt,             :limit => 25
      t.integer :phone
      t.string :address_1
      t.string :address_2
      t.string :town
      t.string :county

      t.timestamps
    end
  end
end
