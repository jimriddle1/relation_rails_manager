require 'rails_helper'

RSpec.describe 'the pokemons show page' do
  it 'displays the attrs of a specific pokemon' do
    # For each parent table
    # As a visitor
    # When I visit ''/child_table_name/:id'
    # Then I see the child with that id including the child's attributes
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    pokemon = trainer.pokemons.create!(name: "Squirtle", level: 12, fainted: false)
    # pokemon_2 = trainer.pokemons.create!(name: "Charmander", level: 6, fainted: false)
    # trainer_2 = Trainer.create!(name: "Brock", age: 21, all_8_badges: false)
    visit "/pokemons/#{pokemon.id}"
    # save_and_open_page
    expect(page).to have_content(pokemon.name)
    expect(page).to have_content(pokemon.level)
    expect(page).to have_content(pokemon.fainted)
  end
end
