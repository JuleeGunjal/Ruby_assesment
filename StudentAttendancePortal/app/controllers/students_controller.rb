class StudentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :find_student, only: %i[show update destroy]

  def index
    @students = Student.all
  end

  def create
    @student = Student.new(student_params)
    respond_to do |format|
      if @student.save
        format.html { redirect_to student_url(@student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end  
  end

  def show
    @student = Student.find(params[:id])
  end

   # GET /students/new
   def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
   @student = Student.find(params[:id])
   render :edit
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to(@student)
    else
      render "edit"
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
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
