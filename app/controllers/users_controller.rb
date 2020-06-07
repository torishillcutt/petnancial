class UsersController < ApplicationController

  get "/users/new" do
    erb :"/users/new.html"
  end

  post "/users" do
    if EmailAddress.valid?(params[:email])
      user = User.create(
        name: params[:name].capitalize,
        email: params[:email],
        password: params[:password],
        location: params[:location]
      )
      if user.save
        @user = user
        erb :"/users/login.html"
      else 
        @error = "Please try again"
        erb :'/users/new.html'
      end
    else
      @error = "Invalid email"
      erb :"/users/new.html"
    end
  end

  get '/users/login' do
      erb :'/users/login.html'
  end


  get "/users/:id" do
    if logged_in? && session[:user_id] == params[:id].to_i
      @user = current_user
    erb :"/users/show.html"
    else
      redirect '/users/login'
    end
  end

  # GET: /users/5/edit
  #get "/users/:id/edit" do
  #  if logged_in && session[:user_id] == params[:id]
  #    @user = current_user
  #  erb :"/users/edit.html"
  #  else
  #    redirect '/users/login'
  #  end
  #end

  # PATCH: /users/5
  # redirect "/users/:id"
  #end

  # DELETE: /users/5/delete
  #delete "/users/:id/delete" do
   # redirect "/users"
  #end
end
