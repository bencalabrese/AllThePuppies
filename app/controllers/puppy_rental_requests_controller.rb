class PuppyRentalRequestsController < ApplicationController
  def new
    @request = PuppyRentalRequest.new
    render :new
  end

  def create
    @request = PuppyRentalRequest.new(request_params)

    if @request.save
      render json: @request
    else
      render json: @request.errors.full_messages
    end
  end

  private
  def request_params
    params.require(:puppy_rental_request).permit(:end_date, :start_date, :puppy_id)
  end
end
