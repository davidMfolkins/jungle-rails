class User < ActiveRecord::Base

  before_validation :cleanup_email
  def cleanup_email
    self.email.downcase!
    self.email.strip!
  end

  def self.authenticate_with_credentials(email, password)
    email.downcase!
    email.strip!  
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  has_secure_password
  validates :email, uniqueness: true
  validates :password, length: { minimum: 3 }
  
end
