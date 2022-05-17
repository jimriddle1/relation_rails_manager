require 'rails_helper'

RSpec.describe Pokemon do
  describe 'relationships' do
    it { should belong_to :trainer }
  end
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :pokedex_num }
    it { should allow_value(true).for(:fainted) }
    it { should allow_value(false).for(:fainted) }
  end

  it 'gives me the pokemon in alphabetical order by name' do
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    pokemon = trainer.pokemons.create!(name: "Squirtle", pokedex_num: 7, fainted: false)
    pokemon_2 = trainer.pokemons.create!(name: "Charmander", pokedex_num: 4, fainted: false)
    pokemon_3 = trainer.pokemons.create!(name: "Bulbasaur", pokedex_num: 1, fainted: false)

    expect(Pokemon.alphabetical).to eq([pokemon_3, pokemon_2, pokemon])
  end

end
