class UsersController < ApplicationController

  def create
	    user = User.new(user_params)
	  if user.save
	      token = encode_token(user.id)
	      byebug
	      render json: {user: UserSerializer.new(user), token: token}
	  else
	      render json: {errors: user.errors.full_messages}
	  end
  end


  def index
	    @users = User.all
	    render json: @users
  end

  def show
	    user = User.find(params[:id])
	    render json: user
  end

  def user_params
  	params.require(:user).permit(:username, :password)
  end
end
