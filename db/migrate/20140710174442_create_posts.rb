class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :search_id, null: false
      t.string :title, null: false
      t.integer :price
      t.string :location
      t.date :date
      t.text :body
      t.string :page_href, null: false
      t.string :url, null: false
      t.string :google_maps_url

      t.timestamps
    end
  end
end
