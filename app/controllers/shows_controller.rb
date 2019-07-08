class ShowsController < ApplicationController
    # before_action :authenticate_user!

    def index
        @shows = Show.all
    end

    def new
        @show = Show.new
        @user = current_user
    end

    def create
        @show = Show.new(show_params)
        if @show.save
            @show.reviews.create(show_id: @show.id)
            redirect_to shows_path(@show)
        else
            render :new
        end
    end

    def show
        find_show
        @user = current_user
        @reviews = show.reviews
    end

    def edit
        find_show
        find_user
    end

    def update
        find_show
        @show.update(show_params)
        # find_user
        # @user = (@user == current_user ? @user : current_user)
        if @show.save
            redirect_to show_path(@show)
        else
            render :edit
        end
    end

    def destroy
        @user = current_user
        find_show.destroy
        
        redirect_to shows_path(@show) 
    end

    def find_user
        @user = User.find_by(id: params[:user_id])
    end

    def find_show
        @show = Show.find_by(id: params[:id])
    end

private
    
    def show_params
        params.require(:show).permit(:user_id, :title, :genre)
    end
    
end