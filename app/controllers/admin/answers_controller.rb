# frozen_string_literal: true


class Admin::AnswersController < Admin::BaseController
  before_action :set_answer, only: %i[destroy show edit update]
  before_action :find_question, only: %i[create new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_answer_not_found

  def edit; end

  def update
      @answer.update ? (redirect_to @answer, t('.success_update')) : (render :edit)
  end

  def show; end

  def destroy
    @answer.destroy
    redirect_to @answer.question, t('.success_delete')
  end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)
    @answer.save ? (redirect_to @answer, t('.success_create')) : (render :new)
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
    render plain: t('.not_found')
  end
end
