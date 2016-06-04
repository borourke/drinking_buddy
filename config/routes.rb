Rails.application.routes.draw do
  get 'beers/:name' => 'beers#main'
end
