class TrainerPokemonsController < ApplicationController
  def index
    # binding.pry
    @trainer = Trainer.find(params[:trainer_id])
    @pokemons = @trainer.pokemons
  end
end
