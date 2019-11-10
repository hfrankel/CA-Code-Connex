class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  # Could not get webhook to make post request. Will fix in future version.
  def webhook
    puts params

    status 200
  end

end