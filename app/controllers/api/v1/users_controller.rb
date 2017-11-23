class Api::V1::UsersController < ApplicationController

  def index 
    users = User.all
    render json: users 
  end 

  def show
    user = User.find(params[:id])
    render json: user 
  end 

  def create 
    user = User.new(user_params)
    if user.save 
      render json: user 
    else 
      render json: {message: "FUCKING EXPLOSION!"}
    end 
  end   

  private 

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end 

end
