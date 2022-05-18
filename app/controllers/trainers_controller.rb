class TrainersController < ApplicationController
  def index
    # binding.pry
    if params[:sorted] == "pokemon_count"
      @trainers = Trainer.trainers_by_pokemon_count
    else
      @trainers = Trainer.trainers_in_order
    end
  end

  def show
    @trainer = Trainer.find(params[:id])
  end

  def new
  end

  def create
    # binding.pry
    trainer = Trainer.create(trainer_params)
    redirect_to "/trainers"
  end

  def edit
    @trainer = Trainer.find(params[:id])
  end

  def update
    trainer = Trainer.find(params[:id])
    trainer.update(trainer_params)
    trainer.save
    redirect_to "/trainers/#{trainer.id}"
  end

  def destroy
    Trainer.destroy(params[:id])
    redirect_to '/trainers'
  end

private
  def trainer_params
    params.permit(:name, :age, :all_8_badges)
  end

end
