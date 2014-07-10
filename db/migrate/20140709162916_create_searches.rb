class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.integer :user_id
      t.string :query, null: false
      t.string :location, null: false
      t.string :category
      t.integer :min_price
      t.integer :max_price

      t.timestamps
    end
  end
end
