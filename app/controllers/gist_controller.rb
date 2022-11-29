class GistsController < ApplicationController

  def create
    result = GistQuestionService.new(@question).call

    @question = current_user.test_passage.current_question

    @gist = Gist.new(gist_params)
    flash_options = if result.success? && gist.save


      {notice: t('.success', url: link_to(t('.gist_link'),
                                  result.url,
                                  target: '_blank'))}
    else
      { alert: t('.failure') }
    end
    redirect_to @test_passage, flash_options
  end
end
