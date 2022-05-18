class Trainer < ApplicationRecord
  has_many :pokemons
  validates :name, presence: true
  validates :all_8_badges, inclusion: [true, false]
  validates :all_8_badges, exlcusion: nil
  validates :age, presence: true

  def self.trainers_in_order
    Trainer.order(created_at: :desc)
  end

  def pokemon_count
    self.pokemons.count
  end

  def self.trainers_by_pokemon_count
    Trainer.all.sort_by do |trainer|
      trainer.pokemon_count
    end.reverse
  end

end
