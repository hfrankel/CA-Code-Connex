class AccountsController < ApplicationController

  def show
    @user = User.find(current_user.id)
  end

  def update

  end

  def delete

  end

end