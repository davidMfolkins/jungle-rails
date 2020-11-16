class User < ActiveRecord::Base

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
  
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 3 }

  
end
