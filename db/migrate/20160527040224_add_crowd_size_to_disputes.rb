class AddCrowdSizeToDisputes < ActiveRecord::Migration
  def change
    add_column :disputes, :crowd_size, :integer
  end
end
