# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_question, only: %i[destroy show edit update]
  before_action :find_test, only: %i[index create new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.inspect
  end

  def edit; end

  def update
    if @question.update
      redirect_to @question
    else
      render :edit
    end
  end

  def show
    render plain: @question.inspect
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path
  end

  def new
    @question = @test.questions.new
  end

  def create
    @new_question = @test.questions.new(question_params)
    if @new_question.save
      redirect_to @new_question
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
