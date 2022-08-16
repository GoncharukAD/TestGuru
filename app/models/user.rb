class User < ApplicationRecord
  has_and_belongs_to_many :tests
  belongs_to :results

  def used_tests(level)
    Test.joins("INNER JOIN results ON results.test_id = tests.id").where(results: {user_id: self.id}, tests: {level: level})
  end
end
