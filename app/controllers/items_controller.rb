class ItemsController < ApplicationController

  # GET: /items
  get "/users/pets/items" do
    erb :"/items/index.html"
  end

  # GET: /items/new
  get "/items/new" do
    erb :"/items/new.html"
  end

  # POST: /items
  post "/items" do
    redirect "/items"
  end

  # GET: /items/5
  get "/users/pets/items/:id" do
    @item = Item.find(params[:id])
    @user = User.find(@item.pet.user_id)
    @pet = Pet.find(@item.pet.id)
    if logged_in? && @user == current_user
      erb :"/items/show.html"
    else
      redirect '/users/login'
    end
  end

  # GET: /items/5/edit
  get "/items/:id/edit" do
    erb :"/items/edit.html"
  end

  # PATCH: /items/5
  patch "/items/:id" do
    redirect "/items/:id"
  end

  # DELETE: /items/5/delete
  delete "/items/:id/delete" do
    redirect "/items"
  end
end
