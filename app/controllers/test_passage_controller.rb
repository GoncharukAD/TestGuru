class TestPassagesController < ApplicationController

  before_action: :set_result, only: %i[show update result]

  def show
  end
  
  def result
  end
  
  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      redirect_to_result_result_path(@test_passage)
    else
      render :show
    end  
  end    

  private

  def set_result
    @test_passage = TestPassage.find(params[:id])
  end  
end  