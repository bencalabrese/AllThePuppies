class PuppiesController < ApplicationController
  def index
    @puppies = Puppy.all
    render :index
  end

  def show
    @puppy = Puppy.find(params[:id])

    render :show
  end

  def new
    @puppy = Puppy.new
    render :new
  end

  def edit
    @puppy = Puppy.find(params[:id])
    render :edit
  end

  #We'll fix this stuff later
  
  # def create
  #   @puppy = Puppy.new(puppy_params)
  #
  #   if @puppy.save
  #     redirect_to @puppy
  #   else
  #     render :new
  #   end
  # end

  # def update
  #   @puppy = Puppy.find(params[:id])
  #
  #   if @puppy.update(puppy_params)
  #     redirect_to @puppy
  #   else
  #     render :edit
  #   end
  # end

  private
  def puppy_params
    params.require(:puppy).permit(
      :name,
      :birth_date,
      :color,
      :sex,
      :description
    )
  end

end
