class SlackController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @body = JSON.parse(request.body.read)
    case @body['type']
    when 'url_verification'
      render json: @body
    when 'event_callback'
      # ..
    end
  end
end
