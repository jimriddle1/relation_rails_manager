class Pokemon < ApplicationRecord
  belongs_to :trainer
  validates :name, presence: true
  validates :fainted, inclusion: [true, false]
  validates :fainted, exlcusion: nil
  validates :level, presence: true
  validates_associated :trainer
end
