class Dispute < ActiveRecord::Base
  validates :title, :situation, presence: true
  belongs_to :user
  belongs_to :respondent, class_name: "User", foreign_key: 'respondent_id'
  acts_as_votable
  before_create :create_activation_digest
  attr_accessor :respondent_username, :activation_token

  #returns hash digest of a given string
  def Dispute.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST  :
                                                                                                   BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token
  def Dispute.new_token
    SecureRandom.urlsafe_base64
  end

  #returns true if the given token matches the digest.
  def authenticated?(activation_token)
    return false if activation_digest.nil?
    BCrypt::Password.new(activation_digest).is_password?(activation_token)
  end


  private

  def create_activation_digest
    self.activation_token = Dispute.new_token
    self.activation_digest = Dispute.digest(activation_token)
  end
end
