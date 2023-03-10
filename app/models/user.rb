class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authorized_tests, class_name: "Test", foreign_key: :author_id

  validates :name, presence: true
  validates :email, presence: true

  def user_tests(level)
    tests.where(level: level)
  end
end
