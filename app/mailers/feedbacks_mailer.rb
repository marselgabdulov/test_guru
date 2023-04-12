class FeedbacksMailer < ApplicationMailer
  def feedbacks_email(feedback)
    mail to: feedback.email, subject: "Feedback from TestGuru"
  end
end
