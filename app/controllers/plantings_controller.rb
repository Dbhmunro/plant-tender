class PlantingsController < ApplicationController

    def create
        @planting = Planting.new(planting_params)
        if @planting.save
            redirect_to garden_bed_path(@planting.garden_bed_id)
        else
            @plant = Plant.find(@planting.plant_id)
            render 'plants/show' #look into flashing error instead of need to render
        end
    end
    
    def update
        #change based on where it is updated from
        # byebug
        @planting = Planting.find_by(id: params[:planting][:id])
        if @planting.update(planting_params)
            redirect_to garden_bed_path(@planting.garden_bed_id)
        else
            @plant = Plant.find(@planting.plant_id)
            render 'plants/show' #look into flashing error instead of need to render
        end
    end

    def destroy
        Planting.find_by(id: params[:planting][:id]).delete
        redirect_to garden_bed_path(params[:planting][:garden_bed_id])
    end

    private

    def planting_params
        params.require(:planting).permit(:id, :plant_id, :garden_bed_id, :plant_count)
    end
end