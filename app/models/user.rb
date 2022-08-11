class User < ApplicationRecord
    def used_tests(level)
        user_id = self.id
       pp Results.where("level = ? AND user_id = ?", level, user_id)
    end
end
