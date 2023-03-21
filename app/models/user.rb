require "digest/sha1"

class User < ApplicationRecord
  include Auth

  has_secure_password

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authorized_tests, class_name: "Test", foreign_key: :author_id

  def user_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
