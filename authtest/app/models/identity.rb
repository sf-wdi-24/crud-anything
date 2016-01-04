class Identity < OmniAuth::Identity::Models::ActiveRecord
	def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
	has_secure_password
	validates :email, presence: true, uniqueness: true
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates :password, length: { minimum: 6 }
end