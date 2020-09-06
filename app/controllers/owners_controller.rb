class OwnersController < ApplicationController

  # GET: /owners
  get "/owners" do
    @owners = Owner.all
    erb :"/owners/index.html"
  end

  # GET: /owners/new
  get "/owners/new" do
    erb :"/owners/new"
  end

  # POST: /owners
  post "/owners" do
    @owner = Owner.new(email: params[:email], password: params[:password])
    if @owner.save
      session[:id] = @owner.id
      redirect "/dogs/new" #should they go to login instead then fill out the dog form? Are they logged in as soon as they create an account
    else 
      erb :'dogs/new'
    end
  end

  
end
