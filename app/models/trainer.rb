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

  def count
    # binding.pry
    self.pokemons.count
  end

end
