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
    render :new
  end

  def edit
    @puppy = Puppy.find(params[:id])
    render :edit
  end

end
