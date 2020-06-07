require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "p3tnanc1als3cr3t"
  end

  get "/" do
    erb :welcome
  end

  post '/sessions' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      @error = "Invalid login credentials"
      erb :'/users/login.html'
    end
  end

  get '/logout' do
    session[:user_id] = nil
    redirect to "/"
  end
  
  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

  end


end
