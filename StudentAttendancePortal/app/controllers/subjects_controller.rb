class SubjectsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :find_teacher, only: %i[create update]
  before_action :find_subject, only: %i[show update destroy]

  def index
    render json: Subject.all
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      render json: { message: I18n.t('controller.save.successful') }
    else
      render json: { message: I18n.t('controller.save.failed') }
    end
  end

  def show
    if @subject
      render json: @subject
    else
      render json: { message: I18n.t('controller.show.failed') }
    end
  end

  def update
    if @subject.update(subject_params)
      render json: { message: I18n.t('controller.update.successful') }
    else
      render json: { message: I18n.t('controller.update.failed') }
    end
  end

  def destroy
    if @subject.destroy
      render json: { message: I18n.t('controller.destroy.successful') }
    else
      render json: { message: I18n.t('controller.destroy.failed') }
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
