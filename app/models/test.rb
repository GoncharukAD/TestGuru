class Test < ApplicationRecord
  belongs_to :category
  belongs_to :results
  has_many :questions
  has_and_belongs_to_many :users
  has_one :user, class_name: "Author", foreign_key: "author_id" #Попытка присоединения автора,не уверен на счёт корректности

  def self.tests_category(category) 
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id").where("categories.title = ?", category).order(title: :desc).pluck(:title)
  end    
end
