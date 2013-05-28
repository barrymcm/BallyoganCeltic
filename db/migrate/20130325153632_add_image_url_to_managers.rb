class AddImageUrlToManagers < ActiveRecord::Migration
  def change
    add_column :managers, :image_url, :string
  end
end
