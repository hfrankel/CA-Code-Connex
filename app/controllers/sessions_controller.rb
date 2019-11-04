class SessionsController < ApplicationController

before_action :authenticate_user!


  def new
    @tutor_id = params[:tutor_id]
    @session = Session.includes(:tutor_id).new
    # @tutor = Tutor.includes(:user).find(params[:id])
    # scores = Tutor.find(params[:id]).ratings.pluck(:score)
    # @ratings_avg_score = scores.sum / scores.count.to_f
    # @sessions_count = Tutor.find(params[:id]).sessions.pluck(:id).count
  end

  def create
    @user = User.find(current_user.id)
    @session = @user.sessions.create(session_params)
    @session.tutor_id = params[:session][:tutor_id]

    if @session.errors.any?
        render "new"
    else
        redirect_to root_path
    end
  end


  private
  def session_params
    params.require(:session).permit(:timestamp, :duration, :cost, :stripe, :note, :tutor_id, :user_id)
  end

end