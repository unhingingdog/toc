class Dispute < ActiveRecord::Base
  validates :title, :situation, presence: true
  belongs_to :applicant, class_name: "User", foreign_key: 'applicant_id'
  belongs_to :respondent, class_name: "User", foreign_key: 'respondent_id'
  attr_accessor :respondent_username
end
