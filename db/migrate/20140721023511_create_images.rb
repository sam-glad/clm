class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :post_id, null: false
      t.string :img_url, null: false

      t.timestamps
    end
  end
end
