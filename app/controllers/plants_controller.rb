class PlantsController < ApplicationController

    def index
        @plants = Plant.all
        # if logged_in? && !!params[:bed_id]
        #     @planted_plants = current_user.plants
        #     @plants_in_bed = garden_bed.plants
        # elsif logged_in?
        #     @planted_plants = current_user.plants
        # end
    end
    
    def show
        @plant = Plant.find(:id)
        # if logged_in? && !!params[:bed_id]
        #     @planted_plants = current_user.plants
        #     @plants_in_bed = garden_bed.plants
        # elsif logged_in?
        #     @planted_plants = current_user.plants
        # end
    end
end
