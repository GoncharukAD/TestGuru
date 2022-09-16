class QuestionsController < ApplicationController
  
  before_action :find_question

  rescue from ActiveRecord::RecordNotFound, with: rescue_with_question_not_found

  def index 
    render plain: 'Просмотр всех вопросов' #Возвращает только это,без списка вопросов

    @test = Test.find(params[:test_id])
    render :json { questions: @test.questions }  
  end

  def show 
    render plain: 'Просмотр конкретного вопроса теста'
    @test = Test.find(params[:test_id])
    @test.questions.find(params[:id])
  end  
  
  def destroy 
    render plain: 'Удаление вопроса'
    @question = Question.find(params[:id])
    @question.destroy
  end
  

  def new
    render plain: 'Создание вопроса'
    @question = Question.create(
      title: params[:question][:title]
      test_id: params[:question][:test_id]
    )
  end
  
  def create
  end 
  
  private

  def find_question
    @test = Question.find(params[:test_id])
    @test.questions.find(params[:id])
  end  

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден' 
  end  
end
