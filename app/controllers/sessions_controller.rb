class SessionsController < ApplicationController

before_action :authenticate_user!


  def new
    @session = Session.new
    @tutor = Tutor.includes(:user).find(params[:id])
    scores = Tutor.find(params[:id]).ratings.pluck(:score)
    @ratings_avg_score = scores.sum / scores.count.to_f
    @sessions_count = Tutor.find(params[:id]).sessions.pluck(:id).count
  end

  def create
    @session = current_user.sessions.create(session_params)

    if @session.errors.any?
        # Do I need to set anything here?
        render "new"
    else
        redirect_to sessions_path
    end
  end

end