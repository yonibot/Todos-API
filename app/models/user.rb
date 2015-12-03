class User < ActiveRecord::Base
  has_many :items
  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true
  before_create :set_token
  has_secure_password


  def set_token
    self.token = SecureRandom.uuid
  end
end
