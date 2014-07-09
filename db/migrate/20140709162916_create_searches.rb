class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.integer :user_id
      t.string :query, null: false
      t.string :city_full, null: false
      t.string :city_short, null: false
      t.string :category_full
      t.string :category_short
      t.integer :min_price
      t.integer :max_price

      t.timestamps
    end
  end
end
