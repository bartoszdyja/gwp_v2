# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def account_activation
      user = User.first
      UserMailer.welcome_email(user)
    end

end
