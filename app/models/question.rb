class Question < ApplicationRecord
  belongs_to :test
  
  has_many :answers, dependent: :destroy

  validates :title, presence: true

  validate :validate_answers
end
