class Pokemon < ApplicationRecord
  belongs_to :trainer
  validates :name, presence: true
  validates :fainted, inclusion: [true, false]
  validates :fainted, exlcusion: nil
  validates :pokedex_num, presence: true
  validates_associated :trainer

  def self.alphabetical
    #use a class method
    Pokemon.order(:name)
  end

  def self.above_pokedex_num_threshold(threshold)
    #use a class method
    Pokemon.where("pokedex_num >= #{threshold}")
    # @pokemons = @trainer.pokemons.where("pokedex_num >= #{params[:number]}")
  end

end
