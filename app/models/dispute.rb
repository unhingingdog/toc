class Dispute < ActiveRecord::Base
  validates :title, :situation, presence: true
  #belongs_to :applicant, class_name: "User"
  #belongs_to :respondent, class_name: "User"
end
