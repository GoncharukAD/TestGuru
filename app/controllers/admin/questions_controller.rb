# frozen_string_literal: true


class Admin::QuestionsController < Admin::BaseController
  before_action :set_question, only: %i[destroy show edit update]
  before_action :find_test, only: %i[create new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def edit; end

  def update
    @question.update ? (redirect_to @question, notice: t('.success_update')) : (render :edit)
  end

  def show; end

  def destroy
    @question.destroy
    redirect_to @question.test, notice: t('.success_delete')
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    @question.save ? (redirect_to @question, notice: t('.success_create')) : (render :new)
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: t('.not_found')
  end
end
