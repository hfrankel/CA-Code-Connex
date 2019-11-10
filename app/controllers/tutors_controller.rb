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
    @skills = Tutor.find(params[:id]).technologies
  end

  def connex
    @technologies = Technology.all
  end
  
end