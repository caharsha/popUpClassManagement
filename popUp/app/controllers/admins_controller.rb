class AdminsController < ApplicationController
    def index
        if session[:loggedIn]
            redirect_to reports_path
        end
    end
    
    def create
        
        username = params[:username]["Username"]
        password = params[:password]["Password"]
        
        
        #records = ActiveRecord::Base.connection.execute("SELECT * FROM Admin WHERE USERNAME = " + username + " AND PASSWORD = " + password)
        #if records.length > 0
        if username == "uname" and password == "pword"
            session[:loggedIn] = true
            redirect_to reports_path
            flash[:success] = "Logged in successfully!"
        else
            session[:loggedIn] = false
            redirect_to admins_path
            flash[:success] = "Invalid username/password combination."
        end
        
        
    end
    
    
end