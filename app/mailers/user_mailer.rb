class UserMailer < ApplicationMailer
	default from: "thepatachoufoundation@gmail.com"

	def user_mail(user, subject)
    	@user = user
    	mail(to: @user.email, subject: subject)
  	end
end
