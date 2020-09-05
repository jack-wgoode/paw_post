class SessionsControllersController < ApplicationController

  # GET: /sessions_controllers
  get "/login" do
    erb :"/sessions/login.html"
  end

  

  # POST: /sessions_controllers
  post "/login" do
    owner = Owner.find_by_email(params[:email])
    # if they typed in the right password then log them in, if not show them the form again
    if owner && owner.authenticate(params[:password]) 
      session[:id] = owner.id
      redirect "/"
    else 
      @error = "Incorrect email or password"
      erb :'/sessions/login'
    end
  end
end

  

