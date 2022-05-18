class Trainer < ApplicationRecord
  has_many :pokemons
  validates :name, presence: true
  validates :all_8_badges, inclusion: [true, false]
  validates :all_8_badges, exlcusion: nil
  validates :age, presence: true

  def self.trainers_in_order
    #use a class method
    Trainer.order(created_at: :desc)
  end

  def pokemon_count
    # binding.pry
    self.pokemons.count
  end

  def self.trainers_by_pokemon_count
    Trainer.all.sort_by do |trainer|
      trainer.pokemon_count
    end.reverse
    # Trainer.all.sort_by { |trainer| trainer.pokemon_count }.reverse
    # binding.pry
    # Trainer.order("pokemon_count desc")
    # Trainer.osrder()
  end

end
