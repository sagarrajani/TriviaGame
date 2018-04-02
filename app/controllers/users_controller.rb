class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def score
    @users = User.order(score: :desc)
  end
end
