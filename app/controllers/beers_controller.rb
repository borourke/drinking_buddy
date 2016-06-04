class BeersController < ApplicationController
  def main
    render json: { 
      version: "1.0",
      response: {
        outputSpeech: {
          type: "PlainText",
          text: "This beer sure is tasty."
        },
        shouldEndSession: true
      }
    }
  end
end