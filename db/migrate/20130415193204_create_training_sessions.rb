class CreateTrainingSessions < ActiveRecord::Migration
  def change
    create_table :training_sessions do |t|
      # t.references :team, :null => false
      t.integer :team_id, :null => false # -- could also write it like this
      t.datetime :date
      t.string :location
      t.string :coach
      t.text :notes

      t.timestamps
    end
    add_index :training_sessions, :team_id
  end
end
