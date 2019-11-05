class TutorsController < ApplicationController
  
  def index
    # \@tutors = Tutor.includes(:user).all

    if @search = params[:search]
      @tutors = Tutor.joins(:user).where("users.firstname LIKE ?", "%#{@search}%")
    else
      @tutors = Tutor.includes(:user).all
    end
  
  end

  def show
    @tutor = Tutor.includes(:technologies_tutors, :technologies).find(params[:id])
    scores = Tutor.find(params[:id]).ratings.pluck(:score)
    @ratings_avg_score = scores.sum / scores.count.to_f
    @sessions_count = Tutor.find(params[:id]).sessions.pluck(:id).count

    @master_tech = @tutor.technologies_tutors.select { |i| i.level == "master" }
    @experienced_tech = @tutor.technologies_tutors.select { |i| i.level == "experienced" }
    @fresh_tech = @tutor.technologies_tutors.select { |i| i.level == "fresh" }
  end

  def connex
    @technologies = Technology.all

  end

end