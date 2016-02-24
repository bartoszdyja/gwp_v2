class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

def welcome_email(user)
  @user = user
  @url  = 'http://localhost:3000/activate'
  @token = Base64.encode64(BCrypt::Password.create(@user.id))
  mail(to: @user.email, subject: 'Confirm your account')
end
end
