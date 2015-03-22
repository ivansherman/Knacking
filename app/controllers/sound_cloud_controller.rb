class SoundCloudController < ApplicationController
  
  def sc_login
    client = SoundCloud.new({
    :client_id     => 'd6231900551ed9644880fdea96827f32',
    :client_secret => 'ab3159fe5998bee3aaf0fa07c1f96be0',
    :redirect_uri  => 'http://localhost:3000/',
    })
    redirect_to client.authorize_url()
  end
end