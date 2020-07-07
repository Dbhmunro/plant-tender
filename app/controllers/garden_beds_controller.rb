class GardenBedsController < ApplicationController
    
    def index
        @garden_beds = User.find(session[:user_id]).garden_beds
    end

    def show
        @garden_bed = GardenBed.find(:id)
        @plants = @garden_bed.plants
    end
    
    def new
        @garden_bed = GardenBed.new
    end
    
    def create
        # if params[:bed][:dimension] == "rectangle"
            # params[:bed][:dimension][:area] = (params[:bed][:dimension][:area_w] * params[:bed][:dimension][:area_l])
        # elsif params[:bed][:dimension] == "circle"
        # end
        @garden_bed = @user.garden_beds.build(bed_params)
        if bed.save
            redirect_to garden_bed_path(@garden_bed)
        else
            render :new
        end
    end
    
    def edit
        @garden_bed = GardenBed.find(:id)
    end

    def update
        @garden_bed = GardenBed.find(:id)
        if @garden_bed.update(bed_params)
            redirect_to garden_beds_path
        else
            render :edit
        end
    end
    
    def destroy
        GardenBed.find(:id).destroy
        redirect_to garden_beds_path
    end

    private

    def bed_params
        params.require(:garden_bed).permit(:name, :area, :area_w, :area_l, :area_d)
    end
end
