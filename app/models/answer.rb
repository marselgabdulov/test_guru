class Answer < ApplicationRecord
  belongs_to :question

  validate :body, presence: true

  scope :correct, -> { where(correct: true) }
end
