class UsersController < ApplicationController

  def index
    # Assure current user is admin to show list
    # otherwise redirects to sign in.
    if current_user.try(:admin?)
      @users = User.all
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @user = User.find(param[:id])
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

  def destroy
    user = User.find(params[:id]).destroy
    flash[:notice] = "User '#{user.email}' destroyed successfully."
    redirect_to(:action => 'index')
  end

  def check_email
    @user = User.find_by_email(params[:user][:email])

    respond_to do |format|
     format.json { render :json => !@user }
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end

  
end
