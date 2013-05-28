class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :league_id, :null => false
      t.string :name
      t.integer :played
      t.integer :won
      t.integer :lost
      t.integer :drawn
      t.integer :goals_for
      t.integer :goals_against
      t.text :achievements

      t.timestamps
    end
  end
end
