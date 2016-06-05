class BeersController < ApplicationController
  def main
    beer_name = params[:request][:intent][:slots][:Beer][:value]
    render json: alexa_response(beer_name: beer_name)
  end
end