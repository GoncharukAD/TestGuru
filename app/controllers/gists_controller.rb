class GistsController < ApplicationController

  def create
    @test_passage =  TestPassage.find(params[:id])
    @question = @test_passage .current_question

    @result = GistQuestionService.new(@question).call

    @gist = Gist.new(
      question_id: @question,
      gist_url: @result.url,
      user_id: current_user)

    flash_options = if @result.success? && @gist.save

      {notice: t('.success', url: link_to(t('.gist_link'),
                                  @result.url,
                                  target: '_blank'))}
    else
      { alert: t('.failure') }
    end
    redirect_to @test_passage, flash_options
  end
end
