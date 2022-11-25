# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test) # Будет возвращать последнюю строчку из results
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

  def gist
  end

  def rescue_with_test_not_found
    render plain: 'Тест не найден'
  end
end
