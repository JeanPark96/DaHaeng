class HomeController < ApplicationController
   before_action :authenticate_user!
    def index
    end
    def safety
        
        
    end
    def profile
        @user=User.find(current_user.id)
    end
    def update
        user = User.find(current_user.id)
        user.name= params[:user_name]
        user.birthday = params[:user_birthday]
        user.gender = params[:user_gender]
        user.save
        
        redirect_to '/home/safety'
    end
    
    def new
        super
    end
    
    def there
    @rscore = params[:review_score]
    end
end