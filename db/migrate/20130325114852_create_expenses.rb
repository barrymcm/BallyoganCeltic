class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :admin_user_id,  :null => false
      t.string :category,     :null => false
      t.text :description
      t.string :supplier,     :limit => 30, :null => false
      t.decimal :amount,      :null => false
      t.date :purchase_date

      t.timestamps

    end
    add_index :expenses, :admin_user_id
  end
end
