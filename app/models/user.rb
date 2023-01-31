class User < ApplicationRecord

  has_secure_password
  validates :password, presence: true, length: { in: 6..25 }
  validates :email, presence: true, :uniqueness => {:case_sensitive => false}
  validates :name, presence: true
  before_save { self.email = email.downcase.strip }

  def self.authenticate_with_credentials(email, password)
    user = User.where("lower(email) = ?", email.strip.downcase).first
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end 


end


