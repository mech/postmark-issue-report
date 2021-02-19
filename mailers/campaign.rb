class Campaign < ActionMailer::Base
  layout "mailer"

  def send_email(email:, source:)
    mail(
      to: email,
      from: "mech@me.com",
      subject: "Test PostMark - From: #{source}"
    )
  end
end
