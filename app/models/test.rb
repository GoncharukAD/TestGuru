class Test < ApplicationRecord
    def self.sort_category(category)
        case category
        when "Backend" then category_id = 2
        when "Frontend" then category_id = 1
        end  
        pp Test.where("category_id = ?, category_id").order(title: :desc)
    end    
end
