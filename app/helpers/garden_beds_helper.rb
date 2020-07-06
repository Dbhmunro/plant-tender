module GardenBedsHelper
    
    def garden_bed
        @garden_bed = Garden_bed.find(params[:id])
    end
    
    def bed_of_user?
        @user.garden_beds.include?(@garden_bed)
    end
end
