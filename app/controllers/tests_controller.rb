# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_test
  skip_before_action :find_test, only: %i[index new create] 

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
  end

  def edit
  end
  
  def update
    if @test.update
      redirect_to @test
    else
      render :edit
    end  
  end  

  def show
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def new 
    @test = Test.new
  end

  def create
    @new_test = Test.new(question_params)
    if @new_test.save
      redirect_to @new_test
    else
      render :new
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Вопрос не найден'
  end
end
