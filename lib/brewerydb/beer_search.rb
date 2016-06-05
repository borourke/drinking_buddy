module Brewerydb
  class BeerSearch
    def initialize(beer_name: "Budweiser")
      @client = Base.new.client
      @type = "beer"
      @endpoint = "/search"
    end

    def description
      response = get(url: @endpoint, params: {type: @type, q: @beer_name})
      response["data"].first["description"]
    end
  end
end