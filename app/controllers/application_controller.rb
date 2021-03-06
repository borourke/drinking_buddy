class ApplicationController < ActionController::Base
  def alexa_response(beer_name:)
    begin
      description = Brewerydb::BeerSearch.new(beer_name: beer_name).description
    rescue
      description = "Drinking buddy was unable to complete this request.  Enjoy a sip of a beer and ask again later."
    end
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
