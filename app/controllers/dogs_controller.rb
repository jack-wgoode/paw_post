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
    redirect "/login" if not logged_in?
    set_dog
    erb :"/dogs/show.html"
  end

 #Update
  get "/dogs/:id/edit" do
    redirect "/login" if not logged_in?
    set_dog
    
    erb :"/dogs/edit.html"
    
  end

  
  patch '/dogs/:id' do
    redirect "/login" if not logged_in?
    set_dog
    
    if @dog.update(name: params[:name], breed: params[:breed], temperament: params[:temperament], comments: params[:comments])
      
      flash[:success] = "Profile successfully updated"
    
      redirect "/dogs/#{@dog.id}"
    else 
      erb :"/dogs/edit.html"
    end
  end

  # Delete
  delete "/dogs/:id" do
    redirect "/login" if not logged_in?
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
    if @dog.nil? || @dog.owner_id != current_owner.id
      #flash[:error] = "Invalid URL"
      redirect "/dogs"
    end
    
  end

 
end
