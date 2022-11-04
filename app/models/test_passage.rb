# frozen_string_literal: true

class TestPassage < ApplicationRecord

  TEST_PASS_RATE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question',  foreign_key: 'question_id', optional: true

  before_validation :before_validation_set_first_question, on: :create


  def completed?
    current_question.nil?
  end  

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
  
    self.correct_question = next_question
    save!
  end  

  def result
    (correct_questions.to_f / test.questions.count * 100).to_i
  end


  def passed?
    result >= TEST_PASS_RATE
  end 

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end  

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end 
  
  def correct_answers(current_question)
    correct_question.answers.correct
  end  

  def next_question
    test.question.order(:id).where('id > ?', current_question.id).first
  end  
end
