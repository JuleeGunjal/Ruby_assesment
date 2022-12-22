class AuthenticationController < ApplicationController
  #before_action :authorize_request, except: [:login, :loginotp]
  
  # POST /auth/login_by_email
  def login_by_email
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(@user, payload = nil)
      time = Time.now + 1.hours.to_i
        render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @user.name }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def send_otp
    @user = User.find_by_mobile_no(params[:mobile_no])   
    if @user
      otp = rand(9999)
      payload = {
        user_id: @user.id,
        otp: otp,
        exp: (Time.now + 1.hours).to_i
      }
      token = JsonWebToken.encode(@user, payload)
      OtpMailer.otp(@user.email, otp, @user).deliver_now
      time = Time.now + 1.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
        username: @user.name }, status: :ok
      else
        render json: { error: 'unauthorized' }, status: :unauthorized
      end
  end
    
   # POST /auth/login_by_otp
  def login_by_otp
    @user = User.find_by_mobile_no(params[:mobile_no])      
    header = request.headers['Authorization']
    header = header.split(' ').last if header 
    token_otp = (JsonWebToken.decode(header)[0]['otp']).to_i             
    if token_otp == params[:otp].to_i
      token = JsonWebToken.encode(@user,payload = nil)
      time = Time.now + 1.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                username: @user.name }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end      
  end

      
  private
   
  def login_params
    params.permit(:email, :password, :mobile_no, :otp)
  end
end
