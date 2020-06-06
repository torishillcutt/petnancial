class ItemsController < ApplicationController

  # GET: /items
  get "/users/pets/:id/items" do
    erb :"/items/index.html"
  end


  get "/users/pets/:id/items/new" do
    @pet = Pet.find(params[:id])
    erb :"/items/new.html"
  end

  post "/users/pets/:id/items" do
    @pet = Pet.find(params[:id])
    if logged_in? && @pet.user_id == current_user
    @item = Item.create(
      name: params[:name],
      category: params[:category],
      cost: params[:cost],
      order_date: params[:order_date],
      pet_id: params[:id]
    )
    redirect "/users/pets/#{@item.pet_id}/items/#{@item.id}"
    else
      redirect '/users/login'
    end
  end


  get "/users/pets/:id/items/:item_id" do
    @item = Item.find(params[:item_id])
    @user = User.find(@item.pet.user_id)
    @pet = Pet.find(@item.pet.id)
    if logged_in? && @user == current_user
      erb :"/items/show.html"
    else
      redirect '/users/login'
    end
  end

  # GET: /items/5/edit
  get "users/pets/:id/items/:user_id/edit" do
    @pet = Pet.find(params[:id])
    if logged_in? && @pet.user_id == current_user
      erb :"/items/edit.html"
    else
      redirect '/users/login'
    end
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
