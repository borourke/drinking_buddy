class BeersController < ApplicationController
  def main
    beer = params[:request][:intent][:slots][:Beer][:value]
    description = get_description(beer_name: beer)
    render json: { 
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

  def get_description(beer_name:)
    response = `curl -X GET 'http://api.brewerydb.com/v2/search?q=budweiser&type=beer&key=7c232372effd9a6ae4edf1494e8e1901'`
    parsed = JSON.parse(response)
    parsed["data"].first["description"]
  end
end