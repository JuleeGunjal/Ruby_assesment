class AttendancesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :find_student, only: %i[create update]
  before_action :find_subject, only: %i[create update]
  before_action :find_attendance, only: %i[show update destroy]

  def index
    render json: Attendance.all
  end

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      render json: { message: I18n.t('controller.save.successful') }
    else
      render json: { message: I18n.t('controller.save.failed') }
    end
  end

  def show
    if @attendance
      render json: @attendance
    else
      render json: { message: I18n.t('controller.show.failed') }
    end
  end

  def update
    if @attendance.update(attendance_params)
      render json: { message: I18n.t('controller.update.successful') }
    else
      render json: { message: I18n.t('controller.update.failed') }
    end
  end

  def destroy
    if @attendance.destroy
      render json: { message: I18n.t('controller.destroy.successful') }
    else
      render json: { message: I18n.t('controller.destroy.failed') }
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:status, :month, :time, :subject_id, :student_id, :date)
  end

  def find_student
    @student = Student.find params[:student_id]
  rescue ActiveRecord::RecordNotFound => e
    render json: { meaasge: I18n.t('controller.present') }
  end

  def find_subject
    @subject = Subject.find params[:subject_id]
  rescue ActiveRecord::RecordNotFound => e
    render json: { meaasge: I18n.t('controller.present') }
  end

  def find_attendance
    @attendance = Attendance.find params[:id]
  rescue ActiveRecord::RecordNotFound => e
    render json: { meaasge: I18n.t('controller.present') }
  end
  
end
