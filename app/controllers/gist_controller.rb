class GistsController < ApplicationController

  private
  def create
    gist = Gist.new(
      question_id: @test_passage.current_question.id,
      gist_url: @created_gist_url,
      user_id: current_user.id
    )
    gist.save
  end
end
