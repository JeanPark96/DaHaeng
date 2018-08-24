class ReviewsController < ApplicationController
    def index
       @reviews = Review.all 
    end    
    
    def new
        @review=Review.new
    end
    

    
    def create
      @review = Review.new(review_params)
      @review.save
      
      redirect_to "/reviews/index"
     
 
    end
    
    def update
     
       @review = Review.new(params[:review])
 
       @review.score = params[:review_score]
       @review.country_id =params[:country_id]
       @review.title = params[:review_title]
       @review.content = params[:review_content]
       @review.date = params[:review_date]
       @review.author = params[:review_author]
       @review.save
        redirect_to "/reviews"
    end
    
    def review
    end
    
    def get_review
        unless @review = Review.where(id: params[:review_id]).first
         redirect_to reviews_path, flash: {alert: "Post doesn't exists"}
        end
    end
    
    def review_params
      params.require(:review).permit(:score, :country_id, :title, :content, :date, :author)
    end
    
    def destroy
        @review = Review.find(params[:id])
        @review.destroy
    
        redirect_to reviews_path
    end
    
    
   def show
     @review = Review.find(params[:id])
   end
   
end
