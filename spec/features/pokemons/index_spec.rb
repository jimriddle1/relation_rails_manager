require 'rails_helper'

RSpec.describe 'the pokemons index page' do
  it 'displays the attrs of each pokemon' do
    # As a visitor
    # When I visit '/child_table_name'
    # Then I see each Child in the system including the Child's attributes:
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    pokemon = trainer.pokemons.create!(name: "Squirtle", level: 12, fainted: false)
    pokemon_2 = trainer.pokemons.create!(name: "Charmander", level: 6, fainted: false)
    binding.pry
    # pokemon_2 = trainer.pokemons.create!(name: "Charmander", level: 6, fainted: false)

    # visit "/pokemons"
    # save_and_open_page
    # expect(page).to have_content(pokemon.name)
    # expect(page).to have_content(pokremon_2.name)
  end

end
