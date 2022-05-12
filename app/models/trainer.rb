class Trainer < ApplicationRecord
  has_many :pokemons
  validates :name, presence: true
  validates :all_8_badges, inclusion: [true, false]
  validates :all_8_badges, exlcusion: nil
  validates :age, presence: true

  def trainers_in_order
    # binding.pry
  end

end
