class User < ApplicationRecord
  def user_tests(level)
    Test.joins("JOIN results ON results.test_id = tests.id")
        .where(results: { user_id: id }, level: level)
  end
end
