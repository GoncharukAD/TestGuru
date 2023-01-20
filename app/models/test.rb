# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy

  validates :title, presence: true,
                    uniqueness: { scope: :level, message: 'Может быть только один тест с таким названием и уровнем' }

  validates :level, numericality: { greater_than_or_equal_to: 0 }

  scope :easy_level, -> { where(level: 0) }
  scope :elementary_level, -> { where(level: 1) }
  scope :advanced_level, -> { where(level: 2) }
  scope :hard_level, -> { where(level: 3) }
  scope :hero_level, -> { where(level: 4..Float::INFINITY) }

  scope :tests_category, lambda { |category_title|
                           joins(:category).where(categories: { title: category_title }).order(title: :desc)
                         }

  def self.array_tests_category(category_title)
    tests_category(category_title).pluck(:title)
  end

  def http_end_time
    (Time.now + self.passing_time.minutes).httpdate unless self.passing_time.nil?
  end
end
