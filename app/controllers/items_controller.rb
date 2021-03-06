class ItemsController < ApplicationController


  get "/users/pets/:id/items/new" do
    @pet = Pet.find(params[:id])
    erb :"/items/new.html"
  end

  post "/users/pets/:id/items" do
    @pet = Pet.find(params[:id])
  if logged_in? && params[:order_date].empty? && @pet.user_id == current_user.id
    @error = "Oops, Please try again!" 
    erb :"/items/new.html"
  elsif logged_in? && !params[:order_date].empty? && @pet.user_id == current_user.id
    @item = Item.create(
      name: params[:name],
      category: params[:category],
      cost: params[:cost].to_i,
      order_date: params[:order_date],
      pet_id: params[:id]
    )
      if @item.save
        redirect "/users/pets/#{@item.pet_id}/items/#{@item.id}"
      else
        @error = "Oops, Please try again"
        erb :"/items/new.html"
      end
    else
      @error = "Please, log in!"
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
      @error = "Please log in!"
      redirect '/users/login'
    end
  end


  get "/users/pets/:id/items/:item_id/edit" do
    @pet = Pet.find(params[:id])
    @user = User.find(@pet.user_id)
    if logged_in? &&  @user == current_user
      @item = Item.find(params[:item_id])
      erb :"/items/edit.html"
    else
      @error = "Please, log in!"
      redirect '/users/login'
    end
  end

  patch "/users/pets/:id/items/:item_id" do
    @item = Item.find(params[:item_id])
    @item.name = params[:name]
    @item.cost = params[:cost].to_i
    @item.category = params[:category]
    @item.order_date = params[:order_date]
    if @item.save
      redirect "/users/pets/#{@item.pet_id}/items/#{@item.id}"
    else
      @error = "Please, try again!"
      erb :"/items/edit.html"
    end
  end

  delete "/users/pets/:id/items/:item_id/delete" do
    @pet = Pet.find(params[:id])
    @user = User.find(@pet.user_id)
    @item = Item.find(params[:item_id])
    if logged_in? && @user == current_user
      @item.delete
      redirect "/users/pets/#{@pet.id}"
    else
      @error = "Please, log in!"
      redirect '/users/login'
    end
  end
end
