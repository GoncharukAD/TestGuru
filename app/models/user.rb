# frozen_string_literal: true

require 'digest/sha1'

class User < ApplicationRecord
  EMAIL_FORMAT = /\A[a-z\d\w.]+@[a-z\d]+\.[a-z]+\z/i.freeze

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: EMAIL_FORMAT

  def used_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
