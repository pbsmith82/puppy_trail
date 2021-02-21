class DogsController < ApplicationController
  before_action :require_user_access, only: [:edit, :update]


  def new
    @dog =  Dog.new
  end



  def index
    @dogs = Dog.all
  end

  def needs_walked
    @dogs = Dog.walk_needed
    render :index
  end

  def by_breeds
    @dogs = Dog.ordered_by_breed
    render :index
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
    @dog = Dog.find_by(id: params[:id])
  end



  def update
    @dog = Dog.find_by(id: params[:id])
    @dog.update(dog_params)
    redirect_to dog_path(@dog)
  end
      
  

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :walks_needed)
  end

  def require_user_access
    dog = Dog.find_by(id: params[:id])
    unless current_user.id == dog.owner.id
      flash[:error] = "Sorry, Access Denied."
      redirect_to user_path(current_user) 
    end
  end

end
