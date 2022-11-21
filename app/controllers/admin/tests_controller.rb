# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: %i[edit update show destroy start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def edit; end

  def update
    @test.update ? (redirect_to @test, notice: t('.success_update')) : (render :edit)
  end

  def show; end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: t('.success_delete')
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.authored_tests.build(test_params) # build возвращает new у объекта коллекции
    if @test.save
      redirect_to @test, notice: t('.success_create')
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
    render plain: t('.not_found')
  end
end
