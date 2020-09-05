class OwnersController < ApplicationController

  # GET: /owners
  get "/owners" do
    erb :"/owners/index.html"
  end

  # GET: /owners/new
  get "/owners/new" do
    erb :"/owners/new.html"
  end

  # POST: /owners
  post "/owners" do
    @owner = Owner.new(email: params[:email], password: params[:password])
    if @owner.save
      session[:id] = @owner.id
      redirect "/"
    else 
      erb :'owners/new'
    end
  end

  
end
