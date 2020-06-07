class VisitsController < ApplicationController

  
    get "/users/pets/:id/visits/new" do
        @pet = Pet.find(params[:id])
        @vets = @pet.visits.map {|visit| Vet.find(visit.vet_id)}.uniq
      erb :"/visits/new.html"
    end
  

    post "/users/pets/:id/visits" do
        @pet = Pet.find(params[:id])
        if logged_in? && @pet.user_id == current_user.id
         if params[:vet][:id]
            @vet = Vet.find(params[:vet][:id])
            @visit = Visit.create(
                pet_id: @pet.id,
                vet_id: @vet.id,
                vet_location: @vet.location,
                cost: params[:visit][:cost].to_i,
                description: params[:visit][:description],
                date: params[:visit][:date]
            )
          else
            @vet = Vet.create(
                name: params[:vet][:name],
                location: params[:vet][:location],
                specialty: params[:vet][:specialty]
            ) 
            @visit = Visit.create(
                pet_id: @pet.id,
                vet_id: @vet.id,
                vet_location: @vet.location,
                cost: params[:visit][:cost].to_i,
                description: params[:visit][:description],
                date: params[:visit][:date]
            )
          end

          if @visit.save
            redirect "/users/pets/#{@pet.id}/visits/#{@visit.id}"
          else
            @error = "Please try again"
            erb :"/visits/new.html"
          end
        else 
          @error = "invalid credentials"
          redirect '/users/login'
        end
    end
  
    get "/users/pets/:id/visits/:visit_id" do
        @pet = Pet.find(params[:id])
        if logged_in? && @pet.user_id == current_user.id
          @visit = Visit.find(params[:visit_id])
          erb :"/visits/show.html"
        else
            @error = "invalid credentials"
            redirect '/users/login'
        end
    end
  
    get "/users/pets/:id/visits/:visit_id/edit" do
        @pet = Pet.find(params[:id])
        @vets = @pet.visits.map {|visit| Vet.find(visit.vet_id)}.uniq
        if logged_in? && @pet.user_id == current_user.id
          @visit = Visit.find(params[:visit_id])
          erb :"/visits/edit.html"
        else
            @error = "invalid credentials"
            redirect '/users/login'
        end
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