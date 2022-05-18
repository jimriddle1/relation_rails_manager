class Pokemon < ApplicationRecord
  belongs_to :trainer
  validates :name, presence: true
  validates :fainted, inclusion: [true, false]
  validates :fainted, exlcusion: nil
  validates :pokedex_num, presence: true
  validates_associated :trainer

  def self.alphabetical
    Pokemon.order(:name)
  end

  def self.above_pokedex_num_threshold(threshold)
    Pokemon.where("pokedex_num >= #{threshold}")
  end

end
