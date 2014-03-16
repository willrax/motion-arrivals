class Broadcast
  attr_reader :url, :data

  def initialize(data)
    @data = data
    @token = App::Persistence[:slack_token]
    @channel = App::Persistence[:channel]
    @url = "https://sydinmotion.slack.com/services/hooks/slackbot?token=#{token}&channel=##{channel}"
  end

  def send
    BW::HTTP.post(url, { payload: data }) do |response|
      puts response.status_code
    end
  end
end
