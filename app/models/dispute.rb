class Dispute < ActiveRecord::Base
  validates :title, :situation, presence: true
end
