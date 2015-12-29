class Parent < ActiveRecord::Base
	# Hashes and salts password
	has_secure_password

	# DB relationship for Parents having many Children
	has_many :children, dependent: :destroy

	# Validations for Parents
	validates :email,
		presence: true,
		uniqueness: true,
		length: {minimum: 6 },
		format: { with: /@/ }

	validates :parent_first_name, 
		presence: true

	validates :parent_last_name, 
		presence: true

	validates :password,
		presence: true,
		length: { minimum: 6 },
		on: :create

end
