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

      expect(trainer.pokemon_count).to eq(3)
    end

    it 'gives me the trainers in order by pokemon count' do
      # As a visitor
      # When I visit the Parents Index Page
      # Then I see a link to sort parents by the number of `child_table_name` they have
      # When I click on the link
      # I'm taken back to the Parent Index Page where I see all of the parents in order of their count of `child_table_name` (highest to lowest) And, I see the number of children next to each parent name

      trainer_2 = Trainer.create!(name: "Misty", age: 10, all_8_badges: false)
      trainer = Trainer.create!(name: "Ash", age: 11, all_8_badges: false)
      pokemon = trainer.pokemons.create!(name: "Squirtle", pokedex_num: 7, fainted: false)
      pokemon_2 = trainer.pokemons.create!(name: "Charmander", pokedex_num: 4, fainted: false)
      pokemon_3 = trainer_2.pokemons.create!(name: "Bulbasaur", pokedex_num: 1, fainted: false)
      pokemon_4 = trainer_2.pokemons.create!(name: "Starmie", pokedex_num: 122, fainted: false)
      pokemon_5 = trainer_2.pokemons.create!(name: "Goldeen", pokedex_num: 120, fainted: false)

      expect(Trainer.trainers_by_pokemon_count).to eq([trainer_2, trainer])


    end
end
