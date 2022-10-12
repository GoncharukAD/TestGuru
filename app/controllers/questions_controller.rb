# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_question, only: %i[destroy show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Test.find(params[:test_id]).questions
    render json: @questions.inspect 
  end

  def show
    @question = Question.find(params[:id])
    render plain: @question.inspect
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
  end

  def new 
  end

  def create
    @question = Question.create(question_params)
    if @question.save
      @question.show
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def find_question
    Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
