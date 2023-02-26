require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "send_to_signup" do
    mail = UserMailer.send_to_signup
    assert_equal "Send to signup", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
