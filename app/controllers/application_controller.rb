require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, ENV["SESSION_SECRET"]
    set :method_override, true  # to allow us to use patch by overriding post
  end

  get "/" do
    redirect "/owners/new"
  end

end
