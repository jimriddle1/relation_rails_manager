class TrainerPokemonsController < ApplicationController
  def index
    if params[:column].nil? == false
      @trainer = Trainer.find(params[:trainer_id])
      @pokemons = @trainer.pokemons.where("pokedex_num >= #{params[:number]}")
      # binding.pry
    elsif params[:sorted] == "alphabetical"
      @trainer = Trainer.find(params[:trainer_id])
      @pokemons = @trainer.pokemons.alphabetical
    else
      @trainer = Trainer.find(params[:trainer_id])
      @pokemons = @trainer.pokemons
    end

  end


  def new
    @trainer = Trainer.find(params[:id])
  end

  def create
    trainer = Trainer.find(params[:id])
    pokemon = trainer.pokemons.create(pokemon_params)
    redirect_to "/trainers/#{trainer.id}/pokemons"
  end

private
  def pokemon_params
    params.permit(:name, :pokedex_num, :fainted)
    # params.permit(:age)
    # params.permit(:all_8_badges)
    # params.permit(:name, :hometown, :genre, etc etc)
  end

end


# @trainer.pokemons.each
