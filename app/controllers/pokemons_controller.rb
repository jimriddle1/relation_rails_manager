class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  # def show
  #   # binding.pry
  #   @pokemon = Pokemon.find(params[:id])
  # end
end
