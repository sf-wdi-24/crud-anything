class ParentMailer < ApplicationMailer
	default from: 'mrockway@gmail.com'

	def welcome_email(parent)
		@parent = parent
		mail(to: @parent.email, subject: 'Welcome to ReMemories')
	end

	def memory_mailer(parent, child, memory)
		@parent = parent
		@child = child
		@memory = memory
		mail(to: @parent.email, subject: "Memory for #{@child.child_first_name}")
	end

end