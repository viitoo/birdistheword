class Api::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    render json: User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render 'users/user_with_token.json.jbuilder', user: @user
    else
      render json: {@user.errors}, status: 500
    end
  end

  def show
    render json: @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end