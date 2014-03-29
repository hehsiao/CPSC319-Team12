class UsersController < ApplicationController

  before_action :check_admin_permission, :only => [:index, :destroy, :update_admin]
  
  def index
    @users = User.all
  end

  def show
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
  end

  def update
  end

  def destroy
    user = User.find(params[:id]).destroy
    flash[:notice] = "User '#{user.email}' destroyed successfully."
    redirect_to(:action => 'index')
  end

  def update_admin
    if current_user.try(:admin?)
      user = User.find(params[:id])
      if user.admin 
        if user.update_attributes(:admin => '0')
          flash[:success] = "User '#{user.email}' status changed to users successfully."
        end
      else
        if user.update_attributes(:admin => '1')
          flash[:success] = "User '#{user.email}' status changed to admin successfully."
        end
      end
      redirect_to(:action => 'index') 
    else
      flash[:error] = "Error Loading Page."
      redirect_to(:action => 'index')
    end
  end

  private

    def participant_list
      @plist = "["
      User.all.each do |u|
        @plist += "{email: '" + u.email + "', name: '#{u}'}, "
      end
      @plist = @b[0...-2]
      @plist += "]"
    end

    def user_params
      params.require(:user).permit(:email, :first_name, :last_name)
    end

  
end
