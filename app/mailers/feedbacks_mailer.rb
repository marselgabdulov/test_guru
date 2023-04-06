class FeedbacksMailer < ApplicationMailer
  default to: %{"TestGuru <admin@testguru.com>"}

  def feedbacks_email(feedback)
    mail to: feedback.email, subject: "Feedback from TestGuru"
  end
end
