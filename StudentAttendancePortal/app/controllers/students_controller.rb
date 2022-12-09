class StudentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :find_student, only: %i[show update destroy]

  def index
    render json: Student.all
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      render json: { message: I18n.t('controller.save.successful') }
    else
      render json: { message: I18n.t('controller.save.failed') }
    end
  end

  def show
    if @student
      render json: @student
    else
      render json: { message: I18n.t('controller.show.failed') }
    end
  end

  def update
    if @teacher.update(student_params)
      render json: { message: I18n.t('controller.update.successful') }
    else
      render json: { message: I18n.t('controller.update.failed') }
    end
  end

  def destroy
    if @student.destroy
      render json: { message: I18n.t('controller.destroy.successful') }
    else
      render json: { message: I18n.t('controller.destroy.failed') }
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :password, :dob, :gender, :address, :semister, :course)
  end

  def find_student
    @student = Student.find params[:id]
  rescue ActiveRecord::RecordNotFound => e
    render json: { meaasge: I18n.t('controller.present') }
  end
end
