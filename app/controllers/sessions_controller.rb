class SessionsController < ApplicationController

  def new
    @session = Session.new
    @tutor = Tutor.includes(:user).find(params[:id])
    scores = Tutor.find(params[:id]).ratings.pluck(:score)
    @ratings_avg_score = scores.sum / scores.count.to_f
    @sessions_count = Tutor.find(params[:id]).sessions.pluck(:id).count
  end

  def create

  end

end