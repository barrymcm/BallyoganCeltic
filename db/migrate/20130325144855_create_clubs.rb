class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.integer :league_id, :null => false
      t.string :name,       :limit => 45
      t.integer :played
      t.integer :won
      t.integer :lost
      t.integer :drawn
      t.integer :goals_for
      t.integer :goals_against
      t.text :achievements, :limit => 225

      t.timestamps
    end

    add_index :clubs, :league_id
  end
end
