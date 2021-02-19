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
    @walk = Walk.find_by(id: params[:id])
  end



  def edit
    @walk = Walk.find_by(id: params[:id])
  end



  def create
    @walk = current_user.walks.build(walk_params)
    @walk.dog_id = params[:dog_id] || @walk.dog_id = params[:walk][:dog_id]
    if @walk.save
      redirect_to walk_path(@walk)
    else
      @dog = Dog.find_by_id(params[:dog_id]) if params[:dog_id]
      render :new
    end
  end



  def update
    @walk = walk.find_by(id: params[:id])
    @walk.update(walk_params)
    redirect_to walk_path(@walk)
  end

  private

  def walk_params
    params.require(:walk).permit(:distance, :fed, :watered)
  end

  


end
