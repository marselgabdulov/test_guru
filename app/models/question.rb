class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validate :body, presence: true
end
