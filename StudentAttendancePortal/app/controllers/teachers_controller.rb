class TeachersController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :find_teacher, only: %i[show update destroy]

  def index
    render json: Teacher.all
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      render json: { message: I18n.t('controller.save.successful') }
    else
      render json: { message: I18n.t('controller.save.failed') }
    end
  end

  def show
    if @teacher
      render json: @teacher
    else
      render json: { message: I18n.t('controller.show.failed') }
    end
  end

  def update
    if @teacher.update(teacher_params)
      render json: { message: I18n.t('controller.update.successful') }
    else
      render json: { message: I18n.t('controller.update.failed') }
    end
  end

  def destroy
    if @teacher.destroy
      render json: { message: I18n.t('controller.destroy.successful') }
    else
      render json: { message: I18n.t('controller.destroy.failed') }
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password, :dob, :gender, :address, :mobile_no)
  end

  def find_teacher
    @teacher = Teacher.find params[:id]
  rescue ActiveRecord::RecordNotFound => e
    render json: { meaasge: I18n.t('controller.present') }
  end
end
