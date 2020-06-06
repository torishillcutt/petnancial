class PetsController < ApplicationController

 
  get "/users/pets" do
   if logged_in?
    @user = current_user
    erb :"/users/show.html"
   else
    redirect '/users/login'
   end
  end

  get "/users/pets/new" do
    if logged_in?
      erb :"/pets/new.html"
    else
      redirect '/users/login'
    end
  end

  post "/users/pets" do
    binding.pry
    pet = Pet.create(
      name: params[:name],
      age: params[:age].to_i,
      category: params[:category],
      user_id: current_user.id
    )
    redirect "/users/pets"
  end

  # GET: /pets/5
  get "/users/pets/:id" do
    
    @pet = Pet.find(params[:id])
    if logged_in? and @pet.user_id == current_user.id
      @user = current_user
      erb :"/pets/show.html"
    else
      redirect '/users/login'
    end
  end

  # GET: /pets/5/edit
  get "/users/pets/:id/edit" do
    @pet = Pet.find(params[:id])
    if logged_in? and @pet.user_id == current_user.id
     erb :"/pets/edit.html"
   else
    redirect '/users/login'
   end
  end

  # PATCH: /pets/5
  patch "/users/pets/:id" do
    @pet = Pet.find(params[:id])
    #binding.pry
    @pet.name = params[:name]
    @pet.age = params[:age].to_i
    @pet.category = params[:category]
    @pet.care_instructions = params[:care_instructions]
    if @pet.save
      redirect "/users/pets/#{@pet.id}"
    else
      @error = "please try again!"
      erb :'/pets/edit.html'
    end
  end

  # DELETE: /pets/5/delete
  delete "/users/pets/:id/delete" do
    redirect "/users/pets"
  end
end
