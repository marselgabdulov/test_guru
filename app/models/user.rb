class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authorized_tests, class_name: "Test", foreign_key: :author_id

  def user_tests(level)
    Test.joins("JOIN results ON results.test_id = tests.id")
        .where(results: { user_id: id }, level: level)
  end
end
