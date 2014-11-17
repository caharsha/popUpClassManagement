class ReportsController < ApplicationController
    def index
        @movies = 1
    end
    
    def show
        @query = params[:id]
    end
end