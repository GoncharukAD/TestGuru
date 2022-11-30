class GistsController < ApplicationController

  def create
    test_passage = TestPassage.find( params.require(:test_passage_id))
    result = GistQuestionService.new(test_passage.current_question).call

    if result.success?
      current_user.gists.create(
        question_id: test_passage.current_question.id,
        gist_url: result.url)

        flash[:notice] = view_context.link_to(t('.success', url: result.url), target: '_blank')
      end
    redirect_to test_passage
  end
end
