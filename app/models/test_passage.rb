# frozen_string_literal: true

class TestPassage < ApplicationRecord
  TEST_PASS_RATE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question
  before_validation :set_remaining_time, on: :create

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    self.current_question = next_question
    mark_as_successfully_passed if self.passed?
    save!
  end


  def check_lefted_time
    self.closed = Time.now >= remaining_time
  end


  def result
    (correct_questions.to_f / test.questions.count * 100).to_i
  end

  def passed?
    result >= TEST_PASS_RATE
  end

  def current_question_number
    test.questions.order(:id).where('id <= ?', current_question).count
  end

  def questions_number
    test.questions.count
  end

  def mark_as_successfully_passed
    self.successfully_passed = true
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    self.test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where("id > ?", current_question.id).first
    self.closed = completed?
  end

  def set_remaining_time
    self.remaining_time = test.http_end_time
  end
end
