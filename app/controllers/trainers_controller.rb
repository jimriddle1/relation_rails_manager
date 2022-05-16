class TrainersController < ApplicationController
  def index
    @trainers = Trainer.order(created_at: :desc)
    # @trainers.trainers_in_order
    # binding.pry
  end

  def show
    # binding.pry
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

private
  def trainer_params
    params.permit(:name, :age, :all_8_badges)
    # params.permit(:age)
    # params.permit(:all_8_badges)
    # params.permit(:name, :hometown, :genre, etc etc)
  end

  # def new
  # end
  #
  # def create
  #   # binding.pry
  #   task = Task.new({
  #     title: params[:task][:title],
  #     description: params[:task][:description]
  #     })
  #     # binding.pry
  #
  #     task.save
  #
  #     # binding.pry
  #     redirect_to '/tasks'
  # end
end
#
#   def show
#     # binding.pry
#     @task = Task.find(params[:id])
#   end

  # def destroy
  #   Task.destroy(params[:id])
  #   redirect_to '/tasks'
  # end
