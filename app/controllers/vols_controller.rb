class VolsController < ApplicationController
    
    def index
       @vols = Lang.all
    end
    
    def create
      @vol = Review.new(review_params)
      @vol.save
      
      redirect_to "/vols/index"
     
 
    end
end
