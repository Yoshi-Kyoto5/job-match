class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id, status: current_user.status)
    # @users = User.where.not(id: current_user.id).where.not(sex: current_user.sex)
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
end
