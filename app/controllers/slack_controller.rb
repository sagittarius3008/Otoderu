class SlackController < ApplicationController
  # slackの認証を通過させるため、絞って認証をスキップ
  skip_before_action :verify_authenticity_token
  def create
    @body = JSON.parse(request.body.read)
    case @body['type']
    when 'url_verification'
      render json: @body
    when 'event_callback'
      json_hash  = params[:slack]
      Body::TestService.new(json_hash).execute
    end
  end
end
