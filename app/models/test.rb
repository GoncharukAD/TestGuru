class Test < ApplicationRecord
  belongs_to :category
  belongs_to :result
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  
  has_many :questions, dependent: :destroy

  def self.tests_category(category) 
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end
end
