class AddIssueToDisputes < ActiveRecord::Migration
  def change
    add_column :disputes, :issue, :string
  end
end
