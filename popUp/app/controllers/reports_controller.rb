class ReportsController < ApplicationController
    def index
    
        if not session[:loggedIn]
            redirect_to admins_path
        end
    
        @movies = 1
    end
    
    def show
    
        if not session[:loggedIn]
            redirect_to admins_path
        end
        
        @reportId = params[:id]
        
        case @reportId
        when 1
            showOne
        when 2
            showTwo
        when 3
            showThree
        when 4
            showFour
        when 5
            showFive
        when 6
            showSix
        when 7
            showCustom
        else
            @query = ""
        end
        
        @result = ActiveRecord::Base.connection.execute(@query)
        
        if @result.length > 0
            @length = @result[0].length
            @length = @length/2
        else
            @length = 0
        end
        #@result = [["MILS", "2014-11-23", "Used"], ["MILS", "2014-11-23", "Used"], ["MILS", "2014-11-23", "Used"]]
        
    end
    
    def validateDate(date, val)
        if date == "" or date == nil
            date = val
        end
        date
    end
    
    def showOne
        startDate = params[:start]["Start"]
        startDate = validateDate(startDate, "2000-01-01")
        endDate = params[:end]["End"]
        endDate = validateDate(endDate, "2500-01-01")
        
        @query = ""
        
    end
    
    def showTwo
    
        startDate = params[:start]["Start"]
        startDate = validateDate(startDate, "2000-01-01")
        endDate = params[:end]["End"]
        endDate = validateDate(endDate, "2500-01-01")
        min = params[:min]["Min"]
        
        @query = ""
    
    end
    
    def showThree
        startDate = params[:start]["Start"]
        startDate = validateDate(startDate, "2000-01-01")
        endDate = params[:end]["End"]
        endDate = validateDate(endDate, "2500-01-01")
        min = params[:min]["Min"]
        
        @query = ""
    end
    
    def showFour
    
        uinList = params[:uins]["UINs"]
        uinList = uinList.split(",")
        
        @query = ""
    
    end
    
    def showFive
        startDate = params[:start]["Start"]
        startDate = validateDate(startDate, "2000-01-01")
        endDate = params[:end]["End"]
        endDate = validateDate(endDate, "2500-01-01")
        targetClass = params[:class]["Class"]
        
        @query = ""
    end
    
    def showSix
        startDate = params[:start]["Start"]
        startDate = validateDate(startDate, "2000-01-01")
        endDate = params[:end]["End"]
        endDate = validateDate(endDate, "2500-01-01")
        targetClasses = params[:classes]["Classes"]
        targetClasses = targetClasses.split(",")
        
        @query = ""
        
    end
    
    def showCustom
        @query = params[:custom]["Custom"]
        #logger.debug "\n\nThis is a debug\n\n\n\nHere is the query\n\n"
        #logger.debug @query
        #@query.gsub! '-', ' '
    end
    
    
end