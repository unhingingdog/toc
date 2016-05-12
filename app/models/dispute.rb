class Dispute < ActiveRecord::Base
  validates :title, :situation, presence: true
  belongs_to :user
  belongs_to :respondent, class_name: "User", foreign_key: 'respondent_id'
  attr_accessor :respondent_username
end
