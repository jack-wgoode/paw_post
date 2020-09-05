class SessionsControllersController < ApplicationController

  # GET: /sessions_controllers
  get "/sessions_controllers" do
    erb :"/sessions_controllers/index.html"
  end

  # GET: /sessions_controllers/new
  get "/sessions_controllers/new" do
    erb :"/sessions_controllers/new.html"
  end

  # POST: /sessions_controllers
  post "/sessions_controllers" do
    redirect "/sessions_controllers"
  end

  # GET: /sessions_controllers/5
  get "/sessions_controllers/:id" do
    erb :"/sessions_controllers/show.html"
  end

  # GET: /sessions_controllers/5/edit
  get "/sessions_controllers/:id/edit" do
    erb :"/sessions_controllers/edit.html"
  end

  # PATCH: /sessions_controllers/5
  patch "/sessions_controllers/:id" do
    redirect "/sessions_controllers/:id"
  end

  # DELETE: /sessions_controllers/5/delete
  delete "/sessions_controllers/:id/delete" do
    redirect "/sessions_controllers"
  end
end
