class ReviewsController < ApplicationController
    before_action :authenticate_user!
    
  
    def index
        @reviews = Review.all
    end

    def create
        @review = Review.create(shown_id: params[:show_id])
        if @review
            redirect_to reviews_path(@review)
        else
            render :show
        end
    end

    def edit
        find_review
        if show.reviews.include?(@review)
            render :edit
        else 
            redirect_to reviews_path
        end
    end

    def update
        find_review
        @review.update(review_params)
        redirect_to reviews_path(@review)
    end

    def show
        find_review        
    end

    # def custom_query
    #     special_index
    # end 
    
    # def special_index
    #     @user = current_user
    #     @reviews = Review.all
    #     five_stars = @reviews.five_stars
    #     not_rated = @reviews.not_rated
    # end

    def find_review
        @review = Review.find_by(id: params[:id])
    end
      
private

    def review_params
        params.require(:review).permit(:show_id, :rating, :comment)
    end

end