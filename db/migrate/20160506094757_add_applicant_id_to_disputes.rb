class AddApplicantIdToDisputes < ActiveRecord::Migration
  def change
    add_reference :disputes, :applicant, index: true, foreign_key: true
  end
end
