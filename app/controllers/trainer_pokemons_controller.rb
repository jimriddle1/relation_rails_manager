class TrainerPokemonsController < ApplicationController
  def index
    @trainer = Trainer.find(params[:trainer_id])
    @pokemon = @artist.pokemons
  end
end
