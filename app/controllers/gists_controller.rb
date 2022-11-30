class GistsController < ApplicationController

  def create
    test_passage = current_user
                  .test_passages.order(:id)
                  .where('id > ?', current_user.id).first

    question = test_passage.current_question

    result = GistQuestionService.new(question).call

    gist = Gist.new(
      question_id: question.id,
      gist_url: result.url,
      user_id: current_user.id)

      flash[:notice] = view_context.link_to(t('.success', url: result.url), target: '_blank')

    redirect_to test_passage
  end
end
