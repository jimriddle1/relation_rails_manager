Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/trainers', to: 'trainers#index'
  get '/trainers/new', to: 'trainers#new'
  post '/trainers', to: 'trainers#create'
  get '/trainers/:id', to: 'trainers#show'
  get '/trainers/:id/edit', to: 'trainers#edit'
  patch '/trainers/:id', to: 'trainers#update'
  get '/trainers/:trainer_id/pokemons', to: 'trainer_pokemons#index'
  delete '/trainers/:id', to: 'trainers#destroy'
  # get '/artists/:artist_id/songs', to: 'artist_songs#index'
  get '/pokemons', to: 'pokemons#index'
  get '/pokemons/:id', to: 'pokemons#show'
  get '/pokemons/:id/edit', to: 'pokemons#edit'
  patch '/pokemons/:id', to: 'pokemons#update'

  get '/trainers/:id/pokemons/new', to: 'trainer_pokemons#new'
  post '/trainers/:id/pokemons', to: 'trainer_pokemons#create'
  # get '/artists/new', to: 'artists#new'
  # post '/artists', to: 'artists#create'
end
