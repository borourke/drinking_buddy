class BeersController < ApplicationController
  def main
    beer_name = params[:request][:intent][:slots][:Beer][:value]
    render json: alex_response(beer_name: beer_name)
  end

  def alexa_response(beer_name:)
    description = Brewerydb::BeerSearch.new(beer_name: beer_name).description
    { 
      version: "1.0",
      response: {
        outputSpeech: {
          type: "PlainText",
          text: description
        },
        shouldEndSession: true
      }
    }
  end
end