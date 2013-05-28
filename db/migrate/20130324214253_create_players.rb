class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :team_id, :null => false
      t.string :first_name, :limit => 25
      t.string :last_name, :limit => 25
      t.date :dob
      t.string :position
      t.integer :squad_number, :limit => 2
      t.integer :goals
      t.integer :played
      t.integer :red_cards
      t.integer :yellow_cards
      t.text :description
      t.text :achievements

      t.timestamps
    end
    # add_index :players, :team_id
  end
end
