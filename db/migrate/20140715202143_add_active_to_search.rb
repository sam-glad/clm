class AddActiveToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :active, :boolean, default: true
  end
end
