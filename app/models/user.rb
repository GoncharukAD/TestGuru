# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true

  def used_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id) #После старта каждый раз будет появляться новая строчка.(?)Поменять сортировку на created_at
  end  

end
