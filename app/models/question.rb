class Question < ApplicationRecord
  belongs_to :test
  
  has_many :answers, dependent: :destroy

  validates :title, presence: true

  validate :validate_answers

  private

  def validate_answers
    errors.add(:answers) if answers.count != (1..4)
  end  
end
