class GardenBedsController < ApplicationController
    before_action :require_login
    
    def index
        @garden_beds = User.find(session[:user_id]).garden_beds
    end

    def show
        @garden_bed = GardenBed.find(params[:id])
        @plants_in_bed = @garden_bed.plants
        @plantings = []
        @companions = []
        @antagonists = []
        @garden_area_remaining = @garden_bed.area
        @plants_in_bed.each do |plant|
            planting = Planting.find_by(plant_id: plant.id, garden_bed_id: @garden_bed.id)
            @garden_area_remaining = @garden_area_remaining - calculate_area_of_plant(plant.spread, planting.plant_count)
            @plantings << planting
            if plant.pairs.any?
                plant.pairs.each do |pair|
                    if plant.plant_pairs.where(:plant_b_id => pair.id)[0][:friend]
                        @companions << pair
                    else
                        @antagonists << pair
                    end
                end
            end
        end
        # byebug
    end
    
    def new
        @garden_bed = GardenBed.new
        if params[:plant_id]
            @plant = Plant.find_by(id: params[:plant_id])
        end
    end
    
    def create
        # byebug
        # params.require(:garden_bed).permit(:area_opt, :area, :area_w, :area_l, :area_d)
        if params[:garden_bed][:area_opt] == "Rectangular" # and not empty
            params[:garden_bed][:area] = (params[:garden_bed][:area_w].to_f * params[:garden_bed][:area_l].to_f)
        elsif params[:garden_bed][:area_opt] == "Circular"
            params[:garden_bed][:area] = ((params[:garden_bed][:area_d].to_f / 2)*3.1415)**2
        end
        @garden_bed = GardenBed.new(bed_params)
        if @garden_bed.save
            redirect_to garden_bed_path(@garden_bed)
        else
            render new_garden_bed_path
        end
    end
    
    def edit
        @garden_bed = GardenBed.find(params[:id])
    end
    
    def update
        @garden_bed = GardenBed.find(params[:id])
        if @garden_bed.update(bed_params)
            redirect_to garden_beds_path
        else
            render :edit
        end
    end
    
    def destroy
        GardenBed.find(params[:garden_bed][:id]).destroy
        redirect_to garden_beds_path
    end

    private

    def bed_params
        params.require(:garden_bed).permit(:user_id, :name, :area, :plant_ids)
    end

    def garden_bed
        @garden_bed = Garden_bed.find(params[:id])
    end
    
    def bed_of_user?
        @user.garden_beds.include?(@garden_bed)
    end

    def calculate_area_of_plant(plant_spread, plant_count)
        ((plant_spread**2)/144)*plant_count #change plant_spread and plant_count to a float to ensure the carrots with 2in show up as taking up space in garden
    end
    
end
