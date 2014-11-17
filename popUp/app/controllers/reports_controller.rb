class ReportsController < ApplicationController
    def index
        @movies = 1
    end
    
    def show
        @query = params[:id]
        
        @query.gsub! '-', ' '
        
        @result = ActiveRecord::Base.connection.execute(@query)
        
        if @result.length > 0
            @length = @result[0].length
            @length = @length/2
        else
            @length = 0
        end
        #@result = [["MILS", "2014-11-23", "Used"], ["MILS", "2014-11-23", "Used"], ["MILS", "2014-11-23", "Used"]]
        
    end
end