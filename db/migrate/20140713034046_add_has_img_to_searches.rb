class AddHasImgToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :has_img, :boolean, default: false
  end
end
