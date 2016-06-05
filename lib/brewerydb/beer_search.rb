module Brewerydb
  class BeerSearch < Base
    def initialize(beer_name: "Budweiser")
      super
      @type = "beer"
      @endpoint = "/search"
    end

    def description
      response = get(url: @endpoint, params: {type: @type, q: @beer_name})
      response["data"].first["description"]
    end
  end
end