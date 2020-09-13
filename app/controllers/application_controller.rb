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
    erb  :"sessions/welcome.html"
  end


  private

  def current_owner
    @current_user ||= Owner.find_by_id(session[:id]) 
  end

  def logged_in?
    !!current_owner 
  end

  
  

end
