class AddRespondentIdToDisputes < ActiveRecord::Migration
  def change
    add_reference :disputes, :respondent, index: true, foreign_key: true
  end
end
