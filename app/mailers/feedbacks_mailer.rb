class FeedbacksMailer < ApplicationMailer

  default to: %{"TestGuru" <admin@testguru.com>}

  def feedbacks_email(feedback)
    @name = feedback.name
    @body = feedback.body
    @email = feedback.email

    mail from: @email, subject: 'Contacts email'
  end
end
