class Answer < ApplicationRecord
  belongs_to :question

  validate :validate_number_of_answers, on: :create
  validates :body, presence: true

  scope :correct, -> { where(correct: true) }

  private

  def validate_number_of_answers
    errors.add(:questions, "Too much answers!") if question.answers.count > 4
  end
end
