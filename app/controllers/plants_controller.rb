class PlantsController < ApplicationController
    before_action :set_user
    
    def index
        # byebug
        if params[:search]
            @plants = Plant.name_like(params[:search])
        else
            @plants = Plant.all
        end
        if !!params[:garden_bed_id]
            bed = GardenBed.find_by(id: params[:garden_bed_id])
            @plants = @plants - bed.plants
        end
        # include plant sorting
        # if logged_in? && !!params[:garden_bed_id]
        #     @planted_plants = current_user.plants
        #     @plants_in_bed = garden_bed.plants
        #     @fav_plants = user.fav_plants
        # elsif logged_in?
        #     @planted_plants = current_user.plants
        #     @fav_plants = user.fav_plants
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
        if logged_in?
            if @user.plants.include?(@plant)
                @garden_beds_without_plant = @user.garden_beds_without_plant(@plant)
                @garden_beds_with_plant = @user.garden_beds_with_plant(@plant)
                @plantings = []
                @garden_beds_with_plant.each do |bed|
                    @plantings << Planting.find_by(garden_bed_id: bed.id, plant_id: @plant.id)
                end
            else
                @garden_beds_without_plant = @user.garden_beds
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

    def search_params
        params.require(:plant).permit(:search)
    end
end
