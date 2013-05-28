class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :company_name, :null => false
      t.string :location
      t.string :first_name, :limit => 25
      t.string :last_name, :limit => 25
      t.string :title, :limit => 25
      t.string :email, :limit => 55, :null => false
      t.integer :phone, :null => false
      t.string :package, :null => false

      t.timestamps
    end
  end
end
