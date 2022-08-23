class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :discription
      t.integer :quantity
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end