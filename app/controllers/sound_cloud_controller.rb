class SoundCloudController < ApplicationController
  
  def sc_login
    client = Soundcloud.new({
    :client_id     => ENV["client_id"],
    :client_secret => ENV["client_secret"],
    :redirect_uri  => 'http://localhost:3000/',
    })
    redirect_to client.authorize_url()
  end
end