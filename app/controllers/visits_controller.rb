class VisitsController < ApplicationController

    # GET: /visits
    get "/visits" do
      erb :"/visits/index.html"
    end
  
    # GET: /visits/new
    get "/visits/new" do
      erb :"/visits/new.html"
    end
  
    # POST: /visits
    post "/visits" do
      redirect "/visits"
    end
  
    # GET: /visits/5
    get "/visits/:id" do
      erb :"/visits/show.html"
    end
  
    # GET: /visits/5/edit
    get "/visits/:id/edit" do
      erb :"/visits/edit.html"
    end
  
    # PATCH: /visits/5
    patch "/visits/:id" do
      redirect "/visits/:id"
    end
  
    # DELETE: /visits/5/delete
    delete "/visits/:id/delete" do
      redirect "/visits"
    end
  end