class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.integer :league_id, :null => false
      t.string :location
      t.datetime :date
      t.string :home_team
      t.string :away_team

      t.timestamps
    end
  end
end
