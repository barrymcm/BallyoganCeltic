class AddImagesToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :images, :string
  end
end
