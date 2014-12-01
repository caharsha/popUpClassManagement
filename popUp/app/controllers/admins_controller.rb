class AdminsController < ApplicationController
    def index
        @seed = 5
    end
    
    def create
        
        username = params[:username]["Username"]
        password = params[:password]["Password"]
        
        
        #records = ActiveRecord::Base.connection.execute("SELECT * FROM Admin WHERE USERNAME = " + username + " AND PASSWORD = " + password)
        #if records.length > 0
        if username == "cameron" and password == "hill"
            session[:loggedIn] = true
            redirect_to reports_path
        else
            session[:loggedIn] = false
            redirect_to admins_path
        end
        
        
    end
    
    
end