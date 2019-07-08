class ShowsController < ApplicationController
    # before_action :authenticate_user!

    def index
        @shows = Show.all
        respond_to do |format|
            format.html {render :index}
            format.json {render :json => @shows}
        end
    end

    def show
        find_show
        respond_to do |format|
            format.html {render :show}
            format.json {render :json => @show}
        end
    end
    
    def new
        @show = Show.new
        @user = current_user
    end

    def create
        @show = Show.new(show_params)
        if @show.save
            @show.reviews.create(show_id: @show.id)
            respond_to do |format|
                format.html {redirect_to @show}
                format.json {render :json => @show}
            end
        else
            render :new
        end
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
            respond_to do |format|
                format.html {redirect_to @show}
                format.json {render :json => @show}
            end
        else
            render :edit
        end
    end

    def destroy
        @user = current_user
        find_show.destroy
        respond_to do |format|
            format.html {redirect_to @shows}
            format.json {head :no_content}
        end
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