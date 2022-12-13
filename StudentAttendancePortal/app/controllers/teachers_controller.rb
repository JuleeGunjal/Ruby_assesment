class TeachersController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :find_teacher, only: %i[show update destroy]

  def index
    @teachers = Teacher.all
  end

  def create
    @teacher = Teacher.new(teacher_params)
    respond_to do |format|
      if @teacher.save
        format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully created." }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end   
  end

   # GET /teachers/1 or /teachers/1.json
   def show
     @teacher = Teacher.find params[:id]
   end
 
   # GET /teachers/new
   def new
     @teacher = Teacher.new
   end
 
   # GET /teachers/1/edit
   def edit
    @teacher = Teacher.find(params[:id])
    render :edit
   end

  

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      redirect_to(@teacher)
    else
      render "edit"
    end
  end

  def destroy   
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: "Teacher was successfully destroyed." }
      format.json { head :no_content }
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
