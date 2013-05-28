class AddImagesToManagers < ActiveRecord::Migration
  def change
    add_column :managers, :images, :string
  end
end
