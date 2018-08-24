class LangsController < ApplicationController
    
    def index
     @langs = Lang.all
    end
    
    def create
      @lang = Review.new(review_params)
      @lang.save
      
      redirect_to "/langs/index"
     
 
    end
end
