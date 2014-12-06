class UpdatesController < ApplicationController
    def index
        @update = 1
    end
    
    def create
    
        if params[:uins]["Uins"]
            updates = params[:uins]["Uins"].split(/\n/)
            
            updates.each do |l|
                line = l.split(",")
                firstName = line[0]
                lastName = line[1]
                uin = line[2]
                
                #Update SQL line
            end
            
        else
            name = params[:name]["Name"]
            code = params[:code]["Code"]
            year = params[:year]["Year"]
            month = params[:month]["Month"]
            day = params[:day]["Day"]
            
            #insert SQL line
        end
    
        flash[:upload] = true
    
        redirect_to updates_path
    
    end
    
    
end