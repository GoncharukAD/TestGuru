class Test < ApplicationRecord
    def self.sort_category(category) 
        Test.joins("INNER JOIN categories ON tests.category_id = categories.id").where("categories.title = ?", category).order(title: :desc).pluck("tests.title")
    end    
end
