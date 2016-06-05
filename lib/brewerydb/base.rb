module Brewerydb
  class Base
    def initialize
      @base_url = "http://api.brewerydb.com"
      @version = "/v2"
      @api_key = "7c232372effd9a6ae4edf1494e8e1901"
    end

    def client
      @client ||= Faraday.new(url: @base_url) do |faraday|
        faraday.request  :url_encoded             
        faraday.response :logger                  
        faraday.adapter  Faraday.default_adapter
      end
    end

    def get(url:, params:)
      response = client.get(@version + @endpoint, params.merge({key: @api_key}))
      JSON.parse(response.body)
    end
  end
end