class BeersController < ApplicationController
  def main
    beer = params[:request][:intent][:slots][:Beer][:value]
    render json: { 
      version: "1.0",
      response: {
        outputSpeech: {
          type: "PlainText",
          text: "#{beer} sure is tasty."
        },
        shouldEndSession: true
      }
    }
  end
end