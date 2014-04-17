class AdminsController < ApplicationController
  def index
    if params[:approved] == "false"
      @users = User.find_all_by_approved(false)
    elsif params[:approved] == "true"
      @users = User.find_all_by_approved(true)
    else
      @users = User.all
    end
  end

  def approve_user
    user = User.find(params[:id])
    user.approved = true
    if user.save
      flash[:notice] = "#{user.email} approved"
    else
      flash[:alert] = "#{user.email} approval failure"
    end
    redirect_to :back
  end
end
