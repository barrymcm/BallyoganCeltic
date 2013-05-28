class RemoveImagesFromPlayers < ActiveRecord::Migration
  def up
    remove_column :players, :images
  end

  def down
    add_column :players, :images, :string
  end
end
