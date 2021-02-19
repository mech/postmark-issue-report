class Campaign < ActionMailer::Base
  layout "mailer"

  def send_email(email:, source:)
    mail(
      to: email,
      from: "tech1@jobline.com.sg",
      subject: "Test PostMark - From: #{source}"
    )
  end
end
