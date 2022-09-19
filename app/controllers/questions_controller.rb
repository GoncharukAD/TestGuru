# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_question, only: %i[destroy show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Test.find(params[:test_id]).questions
    respond_to do |format|
      format.html { render plain: 'Просмотр всех вопросов' } # index.html.erb
      format.xml  { render xml: @questions }
      format.json { render json: @questions }
    end
  end

  def show
    @question = Test.find(params[:test_id]).questions.find(params[:id])
    render plain: @question.inspect
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    render plain: 'Вопрос удален'
  end

  def new; end

  def create
    @question = Question.create(question_params)
    if question.save!
      render plain: @question.inspect
    else
      new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :test_id)
  end

  def find_question
    @test = Question.find(params[:test_id])
    @test.questions.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
