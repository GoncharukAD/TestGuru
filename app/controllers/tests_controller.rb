# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :set_test, only: %i[edit update show destroy start]

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

  def start
    @user = User.first
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test) # Будет возвращать последнюю строчку из results
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
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Тест не найден'
  end
end
