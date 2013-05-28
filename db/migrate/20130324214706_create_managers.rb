class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.integer :team_id, :null => false
      t.string :first_name, :limit => 25
      t.string :last_name, :limit => 25
      t.string :email, :null => false
      t.integer :phone
      t.text :description
      t.text :achievements

      t.timestamps
    end
  end
end
