class AddRunTimeToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :run_time, :datetime
  end
end
