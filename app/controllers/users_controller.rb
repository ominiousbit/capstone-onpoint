class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
      redirect_to root_url, notice: "User deleted."
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to root_path flash[:notice] = "User was successfully updated." }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def edit_individual
    @user = User.find(params[:user_ids])
  end

  def update_individual
    @user = User.update(params[:user].keys, params[:user].values).reject { |p| p.errors.empty? }
    if @user.empty?
      flash[:notice] = "Users updated"
      redirect_to users_url
    else
      render :action => "edit_individual"
    end
  end

end
