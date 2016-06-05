module Brewerydb
  class BeerSearch
    def initialize(beer_name:)
      @base = Base.new
      @type = "beer"
      @endpoint = "/search"
      @beer_name = URI.encode(beer_name)
    end

    def description
      response = @base.get(endpoint: @endpoint, params: {type: @type, q: @beer_name})
      response["data"].first["description"]
    end
  end
end