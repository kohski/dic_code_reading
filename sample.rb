require 'slack-notify'
require 'clockwork'
require 'dotenv'

module Clockwork
  handler do |job|
    puts "Runnnig #{job}"
  end

  every(5, 'hello') do
    Dotenv.load
    client = SlackNotify::Client.new(
      webhook_url: ENV['SLACK_HOOK_URL'],
      channel: "#random",
      username: 'dic_task_user'
    )
    client.notify("hello, slack!")    
  end

end


