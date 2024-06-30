class UserMailer < ApplicationMailer

  default from: "admin@lightmeacandle.com"
  def password_reset_email
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
