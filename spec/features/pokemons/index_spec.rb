require 'rails_helper'

RSpec.describe 'the pokemons index page' do
  it 'displays the attrs of each pokemon' do
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    # Then I see the name of each parent record in the system
    # binding.pry
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    pokemon = trainer.pokemons.create!(name: "Squirtle", level: 12, fainted: false)
    pokemon_2 = trainer.pokemons.create!(name: "Charmander", level: 6, fainted: false)

    visit "/pokemons"
    # save_and_open_page
    expect(page).to have_content(pokemon.name)
    expect(page).to have_content(trainer_2.name)
  end
