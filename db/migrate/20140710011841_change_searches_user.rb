class ChangeSearchesUser < ActiveRecord::Migration
  def up
    change_table :searches do |t|
      t.change :user_id, :integer
    end
  end

  def down
    change_table :products do |t|
      t.change :user
    end
  end
end
