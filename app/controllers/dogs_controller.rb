class DogsController < ApplicationController

  # GET: /dogs
  get "/dogs" do
    @dogs = current_owner.dogs
    erb  :"/dogs/index.html"
  end

  # GET: /dogs/new
  get "/dogs/new" do
    @dog = Dog.new
    erb :"/dogs/new.html"
   
  end

  # POST: /dogs
  post "/dogs" do
    @owner = current_owner
    @dog = @owner.dogs.build(name: params[:name], breed: params[:breed], temperament: params[:temperament], comments: params[:comments])
    if @dog.save
     
      redirect "/dogs" 
    else 
      erb :"/dogs/new.html"
    end
  end

  # GET: /dogs/5
  get "/dogs/:id" do
    @dog = Dog.find_by_id(params[:id])
    erb :"/dogs/show.html"
  end

  # GET: /dogs/5/edit
  get "/dogs/:id/edit" do
    @dog = Dog.find_by_id(params[:id])
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
