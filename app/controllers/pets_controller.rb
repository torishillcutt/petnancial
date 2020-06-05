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

  # POST: /pets
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
    erb :"/pets/show.html"
  end

  # GET: /pets/5/edit
  get "/users/pets/:id/edit" do
    erb :"/pets/edit.html"
  end

  # PATCH: /pets/5
  patch "/users/pets/:id" do
    redirect "/users/pets/:id"
  end

  # DELETE: /pets/5/delete
  delete "/users/pets/:id/delete" do
    redirect "/users/pets"
  end
end
