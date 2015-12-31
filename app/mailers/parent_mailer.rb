class ParentMailer < ApplicationMailer
	default from: 'mrockway@gmail.com'

	def welcome_email(parent)
		@parent = parent
		@url = 'http://localhost:3000/parents/new'
		mail(to: @parent.email, subject: 'Welcome to ReMemories')
	end
end
