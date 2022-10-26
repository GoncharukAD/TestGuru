# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    question.test.title
  end
end
