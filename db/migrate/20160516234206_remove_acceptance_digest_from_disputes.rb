class RemoveAcceptanceDigestFromDisputes < ActiveRecord::Migration
  def change
    remove_column :disputes, :acceptance_digest, :string
  end
end
