class GistsController < ApplicationController

  def create
    @question = current_user.test_passage.current_question

    @result = GistQuestionService.new(@question).call

    @gist = Gist.new(
      question_id: @question,
      gist_url: url,
      user_id: current_user)

    flash_options = if result.success? && @gist.save


      {notice: t('.success', url: link_to(t('.gist_link'),
                                  @result.url,
                                  target: '_blank'))}
    else
      { alert: t('.failure') }
    end
    redirect_to current_user.test_passage, flash_options
  end
end
