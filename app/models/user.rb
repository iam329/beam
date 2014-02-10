class User < ActiveRecord::Base

	before_save { self.email = email.downcase }
	#As long as there is a password_digest column in the database, this one method gives us a secure way to create and authenticate new users. 				  
	has_secure_password

	validates :name, presence: true, 
					 uniqueness: { case_sensitive: false }, 
					 length: { maximum: 50 }
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, 
					  format: { with: VALID_EMAIL_REGEX }, 
					  uniqueness: { case_sensitive: false }

	validates :password, length: { minimum: 6 }

	validates :bio, length: { maximum: 140 }


end
