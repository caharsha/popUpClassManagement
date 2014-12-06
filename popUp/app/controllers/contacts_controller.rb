class ContactsController < ApplicationController


    def index
    
        @adminEmail = "test@gmail.com"
    
    end
    
    def create
    
        email = params[:newEmail]["NewEmail"]
        confirm = params[:confirm]["Confirm"]
        
        if( email == confirm )
            @adminEmail = email
            flash[:newContact] = true
            redirect_to updates_path
        else
            flash[:failedContact] = true
            redirect_to contacts_path
        end
        
        
    
    end
    
end