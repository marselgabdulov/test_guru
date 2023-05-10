class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <admin@testguru.com>)
  layout "mailer"
end
