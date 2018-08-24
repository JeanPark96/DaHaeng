class TogethersController < ApplicationController
      def index
       @togethers = Together.all 
    end    
    
    def new
        @together=Together.new
    end
    

    
    def create
      @together = Together.new(together_params)
      @together.save
      
      redirect_to "/togethers/index"
     
 
    end
    
    def update
     
       @together = Together.new(params[:together])
       @together.title = params[:together_title2]
       @together.content = params[:together_content2]
       @together.date = params[:together_date2]
       @together.save
        redirect_to "/together"
    end
    
    def together
    end
    
    def get_together
        unless @together = Together.where(id: params[:together_id]).first
         redirect_to togethers_path, flash: {alert: "Post doesn't exists"}
        end
    end
    
    def together_params
      params.require(:together).permit( :title2, :content2, :date2)
    end
    
    def destroy
        @together = Together.find(params[:id])
        @together.destroy
    
        redirect_to togethers_path
    end
    
    
   def show
     @together = Together.find(params[:id])
   end
   
end
