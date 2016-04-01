class UsersController < ApplicationController
  def index
 @users = User.all
  end

  def new
    @users = User.new

  end

  def create
    @users = User.new(project_params)
    if @users.save
      flash[:notice] = "Users has been created."
      redirect_to @users
    else
# nothing, yet
    end
  end

  def show
    @users = User.find(params[:id])
  end

  def edit

    @users = User.find(params[:id])
  end

  def update
    @users = User.find(params[:id])
    @users.update(project_params)
    flash[:notice] = "Project has been updated."
    redirect_to @users
  end

  def destroy
    @users = User.find(params[:id])
    @users.destroy
    flash[:notice] = "Project has been destroyed."
    redirect_to @users
  end

  private
  def project_params
    params.require(:user).permit(:name, :description)
  end


end
