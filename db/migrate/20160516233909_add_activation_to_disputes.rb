class AddActivationToDisputes < ActiveRecord::Migration
  def change
    add_column :disputes, :activation_digest, :string
    add_column :disputes, :activated, :boolean, default: false
  end
end
