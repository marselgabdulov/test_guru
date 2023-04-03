class FeedbacksMailer < ApplicationMailer

  default to: %{"TestGuru" <admin@testguru.com>}

  def feedbacks_email(fedbacks)
    @name = fedbacks.name
    @body = fedbacks.body
    @email = fedbacks.email

    mail from: @email, subject: 'Contacts email'
  end
end
