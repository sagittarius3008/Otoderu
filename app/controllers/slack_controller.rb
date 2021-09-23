class SlackController < ApplicationController
  # slackの認証を通過させるため、絞って認証をスキップ
  skip_before_action :verify_authenticity_token
  def create
    @body = JSON.parse(request.body.read)
    case @body['type']
    when 'url_verification'
      render json: @body
    when 'event_callback'
    Slack.configure do |config|
      config.token = ENV['BOT_USER_ACCESS_TOKEN']
    end
    client.chat_postMessage(
      as_user: 'true',
      channel: @body['event']['channel'],
      text: @body['event']['text']
    )
    end
    head :ok
  end
end
