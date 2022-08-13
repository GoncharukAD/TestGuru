class User < ApplicationRecord
    def used_tests(level)
      Test.joins("INNER JOIN results ON results.test_id = tests.id").where("results.user_id = ? AND tests.level = ?", self.id, level)
    end
end
