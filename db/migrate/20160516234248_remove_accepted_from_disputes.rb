class RemoveAcceptedFromDisputes < ActiveRecord::Migration
  def change
    remove_column :disputes, :accepted, :boolean
  end
end
