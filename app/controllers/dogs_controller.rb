class DogsController < ApplicationController

  # GET: /dogs
  get "/dogs" do
    @dogs = Dog.all
    erb  :"/dogs/index.html"
  end

  # GET: /dogs/new
  get "/dogs/new" do
    erb :"/dogs/new.html"
   
  end

  # POST: /dogs
  post "/dogs" do
    @dog = Dog.create(dog_params)
    redirect "/dogs/#{@dog.id}"   #show view
  end

  # GET: /dogs/5
  get "/dogs/:id" do
    @dog = Dog.find(params[:id])
    erb :"/dogs/show.html"
  end

  # GET: /dogs/5/edit
  get "/dogs/:id/edit" do
    @dog = Dog.find(params[:id])
    erb :"/dogs/edit.html"
  end

  # PATCH: /dogs/5
  patch "/dogs/:id" do
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
    redirect "/dogs/#{@dog.id}" 
  end

  # DELETE: /dogs/5/delete
  delete "/dogs/:id/delete" do
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect "/dogs/"
  end

  private

  #helper method to secure against injection
  def dog_params
    allowed = ["name", "breed", "temperament", "comments"]
    params.select{|k| allowed.include?(k)}
  end
end
