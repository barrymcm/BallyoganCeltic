class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :title,    :limit => 50

      t.timestamps
    end
  end
end
