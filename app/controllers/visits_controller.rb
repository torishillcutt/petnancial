class VisitsController < ApplicationController

  
    get "/users/pets/:id/visits/new" do
      erb :"/visits/new.html"
    end
  
    # POST: /visits
    post "/users/pets/:id/visits" do
      redirect "/users/pets/:id/visits/:visit_id"
    end
  
    # GET: /visits/5
    get "/users/pets/:id/visits/:visit_id" do
      erb :"/visits/show.html"
    end
  
    # GET: /visits/5/edit
    get "/users/pets/:id/visits/:visit_id/edit" do
      erb :"/visits/edit.html"
    end
  
    # PATCH: /visits/5
    patch "/users/pets/:id/visits/:visit_id" do
      redirect "/users/pets/:id/visits/:visit_id"
    end
  
    # DELETE: /visits/5/delete
    delete "/users/pets/:id/visits/:visit_id/delete" do
      redirect "/users/pets/:id"
    end
  end