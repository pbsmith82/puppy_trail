class WalksController < ApplicationController
  def new
    if params[:dog_id] && @dog = Dog.find_by_id(params[:dog_id])
      #byebug
      @walk = @dog.walks.new
    else
      @walk = Walk.new
    end  
  end

  def index
    if params[:dog_id] && @dog = Dog.find_by_id(params[:dog_id])
      @walks = @dog.walks
    else
      @walks = Walk.all
    end  
  end

  def show
  end

  def edit
  end

  def create
    #byebug
  end

  def update
  end

  private

  def walk_params
    params.require(:walk).permit(:distance, :fed, :watered)
  end

  


end
