class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  has_many :results, dependent: :destroy
  has_many :users, through: :results
  has_many :questions, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level, message: "Может быть только один тест с таким названием и уровнем" }

  validates :level, numericality: { greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) } 
  scope :medium, -> { where(level: 2..4) } 
  scope :high, -> { where(level: 5..Float::INFINITY) } 

  scope :tests_category, -> (category_title) {joins(:category).where(categories: { title: category_title }).order(title: :desc) }

  def self.array_tests_category(category_title)
    tests_category(category_title).pluck(:title)
  end  
end
