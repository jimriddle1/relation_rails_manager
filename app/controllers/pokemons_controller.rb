class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.where(fainted: true)
  end

  def show
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

  def destroy
    Pokemon.destroy(params[:id])
    redirect_to '/pokemons'
  end

private
  def pokemon_params
    params.permit(:name, :pokedex_num, :fainted)
  end

end
