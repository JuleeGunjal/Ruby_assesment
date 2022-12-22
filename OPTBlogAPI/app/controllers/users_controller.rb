class UsersController < ApplicationController
  before_action :authorize_request, except: %i[create index]
  before_action :find_user, only: %i[show update destroy]

  def index
    @users = User.all 
    render json: @users, status: 200
  end

  def show
    render json: @user, status: 200
  end

  def create   
    @user = User.new(user_params)    
    if @user.save
      totp = ROTP::TOTP.new(@user.otp_secret)
      otp_code = totp.now
      render json: @user, status: 200
    else
      render json: { erors: @user.errors.full_messages }, status: 503
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: 200
    else
      render json: { erors: @user.errors.full_messages }, status: 503
    end
  end

  def destroy
    @user.destroy
  end

  private

    def check_permission
      params[id] === current_user.id
    end
    
    def user_params
      params.permit(:name, :email, :password, :confirm_password, :mobile_no, :gender)
    end

    def find_user
      @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found     
    end
end
