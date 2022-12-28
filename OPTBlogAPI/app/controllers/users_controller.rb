# frozen_string_literal: true

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
      render json: @user, status: 200
    else
      render json: { errors: @user.errors.full_messages }, status: 503
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
    if @user.destroy
      render json: { message: 'User successfuly destroy' }, status: 200
    else
      render json: { erors: @user.errors.full_messages }, status: 503
    end
  end

  private

  def check_permission
    params[id] === current_user.id
  end

  def user_params
    params.permit(:id, :name, :email, :password, :mobile_no, :gender)
  end

  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end
end
