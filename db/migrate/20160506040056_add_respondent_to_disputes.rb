class AddRespondentToDisputes < ActiveRecord::Migration
  def change
    add_column :disputes, :respondent, :string
  end
end
