class PlantsController < ApplicationController
    before_action :set_user
    
    def index
        # byebug
        @plants = Plant.all
        # include plant sorting
        # if logged_in? && !!params[:garden_bed_id]
        #     @planted_plants = current_user.plants
        #     @plants_in_bed = garden_bed.plants
        # elsif logged_in?
        #     @planted_plants = current_user.plants
        # end
    end
    
    def show
        @plant = Plant.find(params[:id])
        @planting = Planting.new
        @companions = []
        @antagonists = []
        if @plant.pairs.any?
            @plant.pairs.each do |pair|
                if @plant.plant_pairs.where(:plant_b_id => pair.id)[0][:friend]
                    @companions << pair
                else
                    @antagonists << pair
                end
            end
        end
        # byebug
        # if logged_in? && !!params[:bed_id]
        #     @planted_plants = current_user.plants
        #     @plants_in_bed = garden_bed.plants
        # elsif logged_in?
        #     @planted_plants = current_user.plants
        # end
    end

    private

    def set_user
        if logged_in?
            current_user
        end
    end
end
