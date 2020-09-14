class DogsController < ApplicationController

  
  get "/dogs" do
    redirect_if_not_logged_in
    @dogs = current_owner.dogs
    erb  :"/dogs/index.html"
  end

  # Create
  get "/dogs/new" do
    redirect "/login" if not logged_in?
    @dog = Dog.new
    erb :"/dogs/new.html"
   
  end

  # POST: /dogs
  post "/dogs" do
   
    @dog = current_owner.dogs.build(dog_params) 
      if @dog.save
         redirect "/dogs" 
      else 
        erb :"/dogs/new.html"
      end
  end

  # Read
  get "/dogs/:id" do
    set_dog
    erb :"/dogs/show.html"
  end

 #Update
  get "/dogs/:id/edit" do
    set_dog
    erb :"/dogs/edit.html"
  end

  
  patch '/dogs/:id' do
    set_dog
    if @dog.update(title: params[:dog][:title], content:params[:dog][:content])
      flash[:success] = "Profile successfully updated"
      redirect "/dogs/#{@dog.id}"
    else 
      erb :"/dogs/edit.html"
    end
  end

  # Delete
  delete "/dogs/:id" do
    set_dog
    @dog.destroy
    redirect "/dogs"
  end

  private

  #helper method to secure against injection
  def dog_params
    allowed = ["name", "breed", "temperament", "comments"]
    params.select{|k| allowed.include?(k)}
  end

  def set_dog
    @dog = Dog.find_by_id(params[:id])
    if @dog.nil?
      flash[:error] = "Couldn't find a Dog with id: #{params[:id]}"
      redirect "/dogs"
    end
  end

 
end
