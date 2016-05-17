class RemoveAcceptedAtFromDisputes < ActiveRecord::Migration
  def change
    remove_column :disputes, :accepted_at, :datetime
  end
end
