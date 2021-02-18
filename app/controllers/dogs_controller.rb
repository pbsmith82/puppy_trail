class DogsController < ApplicationController
  def new
    @dog =  Dog.new
  end

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find_by(id: params[:id])
  end

  def create
    @dog = current_user.owned_dogs.build(dog_params)
    # @dog = Dog.new(dog_params)
    if @dog.save
      # @dog.udpate(owner_id: session[:user_id])
      redirect_to dog_path(@dog)
    else
      render :new
    end

  end

  def edit
  end

  def update
  end


  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :walks_needed)
  end

end
