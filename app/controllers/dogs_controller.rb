class DogsController < ApplicationController

  # GET: /dogs
  get "/dogs" do
    redirect :"/dogs/new.html"
  end

  # GET: /dogs/new
  get "/dogs/new" do
    erb :"/dogs/new.html"
   
  end

  # POST: /dogs
  post "/dogs" do
    dog = Dog.create(dog_params)
    redirect "/dogs/#{dog.id}"   #show view
  end

  # GET: /dogs/5
  get "/dogs/:id" do
    @dog = Dog.find(params[:id])
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

  private

  #helper method to secure against injection
  def dog_params
    allowed = ["name", "breed", "color", "age", "sex", "size", 
    "spayed_or_neutered", "temperament", "favorite_game", "comments"]
    params.select{|k| allowed.include?(k)}
  end
end
