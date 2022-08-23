require "test_helper"

class PaymentInformationMailerTest < ActionMailer::TestCase
  test "create_invoice" do
    mail = PaymentInformationMailer.create_invoice
    assert_equal "Create invoice", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
