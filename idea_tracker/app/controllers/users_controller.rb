class UsersController < ApplicationController
  # layout false

  def index
    @users = User.all
  end

  def show
   # @user = User.find(param[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @subject.save
      flash[:notice] = "User '#{user.email}' created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "User '#{user.email}' updated successfully."
      redirect_to(:action => 'show', :id => @user.id)
    else
      render('edit')
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id]).destroy
    flash[:notice] = "User '#{user.email}' destroyed successfully."
    redirect_to(:action => 'index')
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
