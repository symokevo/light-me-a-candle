require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "password_reset_email" do
    mail = UserMailer.password_reset_email
    assert_equal "Password reset email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
