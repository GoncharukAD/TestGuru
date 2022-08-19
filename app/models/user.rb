class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_one :test, class_name: "Author", foreign_key: "author_id", dependent: :destroy

  def used_tests(level)
    Test.joins("INNER JOIN results ON results.test_id = tests.id").where(results: {user_id: self.id}, tests: {level: level})
  end
end
