class Question < ApplicationRecord
  belongs_to :test

  validate :body, presence: true

  has_many :answers, dependent: :destroy
end
