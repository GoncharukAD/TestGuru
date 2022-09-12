class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :authored_tests, class_name: "Test",  foreign_key: "author_id", dependent: :destroy

  validates :title, presence: true
  validates :email, presence: true

  scope :used_tests, -> (level) {tests.where( level: level)}
=begin
  def used_tests(level)
    self.tests.where(level: level)
  end
=end  
end
