class User < ActiveRecord::Base
	include BCrypt
	validates :name, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "Not Valid"}  
	validates :password_digest, presence: true
	has_many :games

  def password 
  	@password ||= Password.new(password_digest)
  end

  def password=(new_password)
  	@password = Password.create(new_password)
  	self.password_digest = @password
  end 

	def self.authenticate(email, user_password)
		user = User.find_by(email: email)
    if user && (user.password == user_password)
    	return user
  	else
  		nil
  	end
  end
end