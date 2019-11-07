class AccountsController < ApplicationController

  before_action :set_tutor, only: [:edit, :update]
  before_action :set_experiences, only: [:newtutor, :edit]

  def newtutor
    @tutor = Tutor.new
    if @tutor.save
      redirect_to show_account_path
    else
      puts "ERROR!!!!"
    end
  end


  def createtutor
    @tutor = current_user.create_tutor(tutor_params)

    if @tutor.errors.any?
      render "newtutor"
    else 
      redirect_to show_account_path
    end

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
    if @tutor.update(tutor_params)
      redirect_to show_account_path
    else
      redirect_to show_account_path
      puts "Could not update!"
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

  def set_experiences
    @experiences = Tutor.experiences.keys
  end

  def tutor_params
    params.require(:tutor).permit(:pricing, :experience, :bio, :style, :maxduration, technology_ids: [])
  end

  # Convert pricing
  # def translate_params
  #   params[:tutor][:experience] = (params[:tutor][:experience].downcase)
  # end

end