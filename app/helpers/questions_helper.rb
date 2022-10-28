# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    action = question.new_record? ? 'Create' : 'Edit'

    "<h1>#{action} #{question.test.title} Question</h1>".html_safe
  end
end
