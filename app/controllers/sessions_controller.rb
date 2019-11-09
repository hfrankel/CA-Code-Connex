class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :destroy]
  before_action :authenticate_user!


  def new
    @tutor_id = params[:tutor_id]
    @tutor = Tutor.find(@tutor_id)
    @session = Session.includes(:tutor_id).new
    # @sessions_count = Tutor.find(params[:id]).sessions.pluck(:id).count
  end

  def confirm

    @tutor_id = params[:tutor_id]
    @tutor = Tutor.find(@tutor_id)
    @session_cost = @tutor.pricing + (params[:duration].to_i)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: "Tutoring Session with #{@tutor.user.firstname} #{@tutor.user.lastname}",
        description: "#{params[:note]}",
        amount: @session_cost * 100,
        currency: 'aud',
        quantity: 1,
      }],
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          tutor_id: params[:tutor_id],
          cost: @session_cost
        }
      },
      success_url: root_url + "sessions/success",
      cancel_url: root_url
    )

    @session_id = session.id

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

  def index
    @user = current_user
    @sessions = Session.where(user_id: current_user.id)
  end


  def show

  end

  def success

  end

  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to all_sessions_url, notice: 'Session was successfully cancelled.' }
      format.json { head :no_content }
    end
  end


  private
  def session_params
    params.require(:session).permit(:timestamp, :duration, :cost, :stripe, :note, :tutor_id, :user_id)
  end

  def set_session
    @session = Session.find(params[:id])

      if @session == nil
        redirect_to all_sessions_path
      end
  end

end