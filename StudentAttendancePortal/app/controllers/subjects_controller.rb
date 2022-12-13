class SubjectsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :find_subject, only: %i[show update destroy]

  def index
    @subjects = Subject.all
  end

  def create
    @subject = Subject.new(subject_params)
    respond_to do |format|
      if @subject.save
        format.html { redirect_to subject_url(@subject), notice: "subject was successfully created." }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end 
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
    
  end

  def edit
    @subject = Subject.find(params[:id])   
    render :edit
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update(subject_params)
      redirect_to(@subject)
    else
      render "edit"
    end
  end

  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: "subject was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :code, :teacher_id)
  end

  def find_teacher
    @teacher = Teacher.find params[:teacher_id]
  rescue ActiveRecord::RecordNotFound => e
    render json: { meaasge: I18n.t('controller.present') }
  end
  def find_subject
    @subject = Subject.find params[:id]
  rescue ActiveRecord::RecordNotFound => e
    render json: { meaasge: I18n.t('controller.present') }
  end
end
