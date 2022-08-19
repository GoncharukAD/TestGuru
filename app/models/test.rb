class Test < ApplicationRecord
  belongs_to :category
  belongs_to :result
  belongs_to :user
  belongs_to :user, class_name: "Author", foreign_key: "author_id"
  
  has_many :questions, dependent: :destroy

  def self.tests_category(category) 
    Test.joins(:category).where(categories: { title: category_title }).order(title: :desc).pluck(:title)
  end
end
