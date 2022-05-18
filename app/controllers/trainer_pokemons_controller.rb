class TrainerPokemonsController < ApplicationController
  def index
    if params[:column].nil? == false
      @trainer = Trainer.find(params[:trainer_id])
      @pokemons = @trainer.pokemons.above_pokedex_num_threshold(params[:number])
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
  end

end
