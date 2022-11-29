class GistsController < ApplicationController

  def create(url)
    gist = Gist.new(
      question_id: @test_passage.current_question.id,
      gist_url: url,
      user_id: current_user.id
    )
    gist.save!
  end
end
