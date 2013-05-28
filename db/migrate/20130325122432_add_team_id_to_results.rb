class AddTeamIdToResults < ActiveRecord::Migration
  def change
    add_column :results, :team_id, :integer

    add_index :results, :team_id
    add_index :results, :league_id
  end
end
