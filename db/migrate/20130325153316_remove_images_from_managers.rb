class RemoveImagesFromManagers < ActiveRecord::Migration
  def up
    remove_column :managers, :images
  end

  def down
    add_column :managers, :images, :string
  end
end
