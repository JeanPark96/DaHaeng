class HomeController < ApplicationController
    def index
    end
    def safety
        @user=User.find(current_user.id)
    end
    def review_create
        @post = Review.new

       @post.score = params[:review_score]
       @post.title = params[:review_title]
       @post.content = params[:review_content]
       @post.date = params[:review_date]
       @post.author = params[:review_author]
       @post.save
       redirect to "/home/review"
    end
    def update
        user = User.find(current_user.id)
        user.name= params[:user_name]
        user.birthday = params[:user_birthday]
        user.gender = params[:user_gender]
        user.save
        redirect_to '/home/safety'
    end
    
    def there
    @rscore = params[:review_score]
    end

end