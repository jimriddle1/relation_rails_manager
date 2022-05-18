require 'rails_helper'

RSpec.describe Trainer do
  describe 'relationships' do
    it { should have_many :pokemons }
  end
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should allow_value(true).for(:all_8_badges) }
    it { should allow_value(false).for(:all_8_badges) }
  end

  it 'displays the trainers in order by creation date desc order' do

    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    trainer_2 = Trainer.create!(name: "Brock", age: 21, all_8_badges: false)
    expect(Trainer.trainers_in_order).to eq([trainer_2, trainer])
  end


    it 'counts the number of pokemon' do
      trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
      pokemon = trainer.pokemons.create!(name: "Squirtle", pokedex_num: 7, fainted: false)
      pokemon_2 = trainer.pokemons.create!(name: "Charmander", pokedex_num: 4, fainted: false)
      pokemon_3 = trainer.pokemons.create!(name: "Bulbasaur", pokedex_num: 1, fainted: false)

      expect(trainer.count).to eq(3)
    end
end
