class AuthController < ApplicationController

  def login
    user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      token = encode_token(user.id)
      
      render json: {user: UserSerializer.new(user), token: token}
    else
      render json: {errors: "Incorrect Login Information"}
    end
  end

  def auto_login
    if session_user
      render json: session_user
    else
      render json: {errors: "Don't touch my cookies!"}
    end
  end

end