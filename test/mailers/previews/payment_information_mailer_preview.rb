# Preview all emails at http://localhost:3000/rails/mailers/payment_information_mailer
class PaymentInformationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_information_mailer/create_invoice
  def create_invoice
    PaymentInformationMailer.create_invoice
  end

end
