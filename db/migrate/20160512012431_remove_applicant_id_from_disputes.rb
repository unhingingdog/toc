class RemoveApplicantIdFromDisputes < ActiveRecord::Migration
  def change
    remove_column :disputes, :applicant_id, :integer
  end
end
