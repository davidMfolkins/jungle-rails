class User < ActiveRecord::Base

  has_secure_password

  
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 3 }

  
end
