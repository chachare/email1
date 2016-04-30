require 'mailgun'
class HomeController < ApplicationController
    def index
        
    end
    
    def write
        @almond = params[:title]
        @anchovy = params[:email]
        @cherry = params[:content]
        
        mg_client = Mailgun::Client.new("key-525d91f84a10b29831f4b0b35c55c8e2")

        message_params =  {
                   from: 'julietmikey@gmail.com',
                   to:   @anchovy,
                   subject: @almond,
                   text:    @cherry
                  }

        result = mg_client.send_message('sandboxf80763e812304e438aa2dd3ee460f19f.mailgun.org', message_params).to_h!

        message_id = result['id']
        message = result['message']
    end
end
