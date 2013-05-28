class ChangeAchievementsToLimitNil < ActiveRecord::Migration
  def up
    change_column :clubs, :achievements, :string
  end

  def down
  end
end
