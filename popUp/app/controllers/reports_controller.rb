class ReportsController < ApplicationController
    def index
        @movies = 1
    end
    
    def show
        @query = params[:id]
        
        @query.gsub! '-', ' '
        
        #result = ActiveRecord::Base.connection.execute(@query)
        
        @result = [["MILS", "2014-11-23", "Used"], ["MILS", "2014-11-23", "Used"], ["MILS", "2014-11-23", "Used"]]
        
    end
end