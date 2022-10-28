# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_test, only: %i[edit update show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def edit; end

  def update
    if @test.update
      redirect_to @test
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  private

  def test_params
    params
    .require(:test)
    .permit(:title, :level, :category_id)
    .with_defaults(author_id: 1)#ПОТОМ УДАЛИТЬ!
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Тест не найден'
  end
end
