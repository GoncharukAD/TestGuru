class QuestionsController < ApplicationController

  def index 
    
    render plain: 'Просмотр всех вопросов'

    render json { tests: questions } #как обратиться к тесту,чтобы посмотреть у него вопросы?
    
    end  
  end

  def show 
    render plain: 'Просмотр конекретного вопроса теста'
  end  
  
  def destroy 
    render plain: 'Удаление вопроса'
  end
  

  def create 
    render plain: 'Создание вопроса'
  end  
    
end
