class DogsController < ApplicationController

  # GET: /dogs
  get "/dogs" do
    erb :"/dogs/index.html"
  end

  # GET: /dogs/new
  get "/dogs/new" do
    erb :"/dogs/new.html"
  end

  # POST: /dogs
  post "/dogs" do
    redirect "/dogs"
  end

  # GET: /dogs/5
  get "/dogs/:id" do
    erb :"/dogs/show.html"
  end

  # GET: /dogs/5/edit
  get "/dogs/:id/edit" do
    erb :"/dogs/edit.html"
  end

  # PATCH: /dogs/5
  patch "/dogs/:id" do
    redirect "/dogs/:id"
  end

  # DELETE: /dogs/5/delete
  delete "/dogs/:id/delete" do
    redirect "/dogs"
  end
end
