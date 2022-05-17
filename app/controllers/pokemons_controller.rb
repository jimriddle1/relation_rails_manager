class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    # binding.pry
    @pokemon = Pokemon.find(params[:id])
  end


  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    pokemon = Pokemon.find(params[:id])
    pokemon.update(pokemon_params)
    pokemon.save
    redirect_to "/pokemons/#{pokemon.id}"
  end

private
  def pokemon_params
    params.permit(:name, :pokedex_num, :fainted)
    # params.permit(:age)
    # params.permit(:all_8_badges)
    # params.permit(:name, :hometown, :genre, etc etc)
  end


end
