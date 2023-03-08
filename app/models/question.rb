class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validate :body, presence: true
  validate :answers, length: { minimum: 1, maximum: 4 }
end
