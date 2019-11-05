class AccountsController < ApplicationController

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

  end

  def edit
    @user = current_user
    @tutor = Tutor.find_by(user_id: current_user.id)
  end

  def delete

  end

end