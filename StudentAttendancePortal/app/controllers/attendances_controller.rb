class AttendancesController < ApplicationController
  protect_from_forgery with: :null_session
  #before_action :find_student, only: %i[create update]
  #before_action :find_attendance, only: %i[create update]
  #before_action :find_attendance, only: %i[show update destroy]

  def index
    @attendances = Attendance.all
  end

  def create
    @attendance = Attendance.new(attendance_params)
    respond_to do |format|
      if @attendance.save
        format.html { redirect_to attendance_url(@attendance), notice: "Attendance was successfully created." }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @attendance = Attendance.find(params[:id])
  end

  def new
    @attendance = Attendance.new
    
  end

  def edit
    @attendance = Attendance.find(params[:id])   
    render :edit
  end

  def update
    @attendance = Attendance.find(params[:id])
    if @attendance.update(attendance_params)
      redirect_to(@attendance)
    else
      render "edit"
    end
  end

  def destroy
    @status_update = Attendance.find(params[:id])
    if @status_update.present?
      @status_update.destroy
    end
    redirect_to attendances_url
  end



  private

  def attendance_params
    params.require(:attendance).permit(:status, :month, :time, :attendance_id, :student_id, :date)
  end

  def find_student
    @student = Student.find params[:student_id]
  rescue ActiveRecord::RecordNotFound => e
    render json: { meaasge: I18n.t('controller.present') }
  end

  def find_attendance
    @attendance = attendance.find params[:attendance_id]
  rescue ActiveRecord::RecordNotFound => e
    render json: { meaasge: I18n.t('controller.present') }
  end

  def find_attendance
    @attendance = Attendance.find params[:id]
  rescue ActiveRecord::RecordNotFound => e
    render json: { meaasge: I18n.t('controller.present') }
  end
  
end
