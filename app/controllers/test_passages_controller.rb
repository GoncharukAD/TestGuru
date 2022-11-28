# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    @created_gist_url = result.url

    flash_options = if result
      gist_create(result.html_url)

      {notice: t('.success', url: view_context.link_to(t('.gist_link'),
                                                          @created_gist_url,
                                                          target: '_blank',
                                                          rel: 'noopener'))}
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def gist_create(url)
    gist = Gist.new(
      question_id: @test_passage.current_question.id,
      gist_url: @created_gist_url,
      user_id: current_user.id
    )
    gist.save
  end


  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
