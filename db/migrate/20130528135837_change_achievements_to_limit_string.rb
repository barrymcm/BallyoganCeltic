class ChangeAchievementsToLimitString < ActiveRecord::Migration
  def up
    change_column :clubs, :achievements, :string
  end

  def down
    change_column :clubs, :achievements, :text
  end
end
