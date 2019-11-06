class AccountsController < ApplicationController

  before_action :set_tutor, only: [:edit, :update]

  def newtutor
    @tutor = Tutor.new
  end


  def createtutor


  end


  def show
    if current_user == nil
      redirect_to new_user_session_path
    else
      @user = User.find(current_user.id)
      @tutor = Tutor.find_by(user_id: current_user.id)
      @active_tutor = Tutor.where(user_id: "#{current_user.id}")
    end
  end

  def update
    if @tutor.update
      redirect_to show_account_path(params[:id])
    end
  end

  def edit
    @user = current_user
  end

  def delete

  end

  private

  def set_tutor
    @tutor = Tutor.find_by(user_id: current_user.id)
  end


end