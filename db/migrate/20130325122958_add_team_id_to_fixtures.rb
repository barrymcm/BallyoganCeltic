class AddTeamIdToFixtures < ActiveRecord::Migration
  def change
    add_column :fixtures, :team_id, :integer

    add_index :fixtures, :team_id
    add_index :fixtures, :league_id
  end
end
