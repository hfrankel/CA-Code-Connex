class TutorsController < ApplicationController
  
  def index
    if @search = params[:search]
      @tutors = Tutor.joins(:user).where("users.firstname LIKE ?", "%#{@search}%")
    else
      @tutors = Tutor.includes(:user).all
    end
  end

  def show
    @tutor = Tutor.includes(:technologies_tutors, :technologies).find(params[:id])
    @sessions_count = Tutor.find(params[:id]).sessions.pluck(:id).count

    @master_tech = @tutor.technologies_tutors.select { |i| i.level == "master" }
    @experienced_tech = @tutor.technologies_tutors.select { |i| i.level == "experienced" }
    @fresh_tech = @tutor.technologies_tutors.select { |i| i.level == "fresh" }
  end

  def connex
    @technologies = Technology.all
  end

end