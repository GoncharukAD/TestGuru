# frozen_string_literal: true

class AnswersController < ApplicationController
  
  before_action :set_answer, only: %i[destroy show edit update]
  before_action :find_question , only: %i[create new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_answer_not_found

  def edit; end

  def update
    if @answer.update
      redirect_to @answer
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @answer.destroy
    redirect_to @answer.question
  end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(question_params)
    if @answer.save
      redirect_to @answer
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:title)
  end

  def find_question
    @answer = Question.find(params[:question_id])
  end
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def rescue_with_answer_not_found
    render plain: 'Ответ не найден'
  end
end
