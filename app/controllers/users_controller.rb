class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    #binding.pry
    if EmailAddress.valid?(params[:email])
      user = User.create(
        name: params[:name],
        email: params[:email],
        password: params[:password],
        location: params[:location]
      )
      if user.save
        erb :"/users/login"
      else 
        @error = "Please try again"
        erb :'/users/new.html'
      end
    else
      @error = "Invalid email"
      erb :"/users/new.html"
    end
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
