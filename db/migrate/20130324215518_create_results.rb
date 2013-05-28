class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :league_id, :null => false
      t.string :location
      t.datetime :date
      t.string :home_team
      t.string :away_team
      t.integer :home_score
      t.integer :away_score

      t.timestamps
    end
  end
end
