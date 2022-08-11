class User < ApplicationRecord
    def used_tests(level)
       pp Test.where("level = ?, level")
    end   
end
