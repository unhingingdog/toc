class AddUserToDisputes < ActiveRecord::Migration
  def change
    add_reference :disputes, :user, index: true, foreign_key: true
  end
end
