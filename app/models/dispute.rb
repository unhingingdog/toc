class Dispute < ActiveRecord::Base
  validates :title, :situation, presence: true
  belongs_to :user
  #belongs_to :respondent, class_name: "User", foreign_key: 'respondent_id'
  # attr_accessor :respondent_username

  #returns hash digest of a given string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST  :
                                                                                                   BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #returns true if the given token matches the digest.
def authenticated?(acceptance_token)
  return false if acceptance_digest.nil?
  BCrypt::Password.new(acceptance_digest).is_password?(acceptance_token)
end
end
