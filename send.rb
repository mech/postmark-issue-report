#!/usr/bin/env ruby

require "bundler/setup"
Bundler.require

require "action_mailer"
require "active_support/json/encoding"

require_relative "mailers/campaign"

# Setup ActionMailer view first
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.view_paths = File.expand_path(
  "views", File.dirname(__FILE__)
)

# Using PostMark, encounter:
# /lib/postmark/json.rb:7:in encode': undefined method `to_json'
ActionMailer::Base.delivery_method = :postmark
ActionMailer::Base.postmark_settings = {
  api_token: ENV["POSTMARK_API_KEY"]
}

# Using normal AWS SES, we are able to send email
# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.smtp_settings = {
#   address: 'email-smtp.us-west-2.amazonaws.com',
#   port: 587,
#   user_name: ENV['AWS_SES_USERNAME'],
#   password: ENV['AWS_SES_PASSWORD'],
#   authentication: :login,
#   enable_starttls_auto: true
# }

Campaign.send_email(email: "mech@me.com", source: "PostMark").deliver
