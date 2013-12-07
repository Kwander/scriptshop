class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :author
      t.integer :bought

      t.timestamps
    end
  end
end
