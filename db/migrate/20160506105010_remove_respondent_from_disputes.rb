class RemoveRespondentFromDisputes < ActiveRecord::Migration
  def change
    remove_column :disputes, :respondent, :string
  end
end
