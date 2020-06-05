class PetsController < ApplicationController

  # GET: /pets
  get "/users/pets" do
    @user = current_user
    erb :"/users/show.html"
  end

  # GET: /pets/new
  get "/users/pets/new" do
    erb :"/pets/new.html"
  end

  # POST: /pets
  post "/users/pets" do
    redirect "/pets"
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
    redirect "/pets/:id"
  end

  # DELETE: /pets/5/delete
  delete "/users/pets/:id/delete" do
    redirect "/pets"
  end
end
