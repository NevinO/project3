class HomeController < ApplicationController
  def index
      @home = Home.order(date: :desc)
    end

    def edit
      @home = Home.find(params[:id])
      respond_to do |format|
        format.html
        format.js
      end
    end

    def update
      @home = Home.find(params[:id])
      if @home.update(home_params)
        respond_to do |format|
          format.html { redirect_to home_path }
          format.js
        end
      else
        # flash[:alert] = "An error occurred."
        render :index
      end
    end

  private
    def home_params
      params.require(:home).permit(:date, :body, :notes)
    end
end
