class PaymentInformationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_information_mailer.create_invoice.subject
  #
  def create_invoice(product,qty,email)
    @product = product
    @product_qty = qty


    mail to: "to@example.org"
  end
end
