class User < ActiveRecord::Base
	has_secure_password
	validates :email, presence: true, :uniqueness => true
	validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates :name, presence: true
	validates :password, length: {minimum: 6}

	before_create { generate_token(:auth_token) }

	has_many :cards
	has_many :search_queries

	def generate_token(column)
	  begin
	    self[column] = SecureRandom.urlsafe_base64
	  end while User.exists?(column => self[column])
	end
end
