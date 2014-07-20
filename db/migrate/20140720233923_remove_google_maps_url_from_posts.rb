class RemoveGoogleMapsUrlFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :google_maps_url
  end
end
