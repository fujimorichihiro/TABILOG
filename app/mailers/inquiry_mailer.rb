class InquiryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inquiry_mailer.inquiry_mail.subject
  #
  def inquiry_mail(inquiry)
    @inquiry = inquiry
    mail(to: @inquiry.email, subject: 'お問い合わせを受け付けました。')
  end
end
