require 'rails_helper'

RSpec.describe 'the trainers pokemon index page' do

  it 'displays all the pokemons of a given trainer' do
#     As a visitor
#     When I visit '/parents/:parent_id/child_table_name'
#     Then I see each Child that is associated with that Parent with each Child's attributes:
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    pokemon = trainer.pokemons.create!(name: "Squirtle", pokedex_num: 7, fainted: false)
    pokemon_2 = trainer.pokemons.create!(name: "Charmander", pokedex_num: 4, fainted: false)
    visit "/trainers/#{trainer.id}/pokemons"
    # save_and_open_page
    expect(page).to have_content(pokemon.name)
    expect(page).to have_content(pokemon_2.name)
  end

  it 'has the child link on this page' do
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    pokemon = trainer.pokemons.create!(name: "Squirtle", pokedex_num: 7, fainted: false)
    pokemon_2 = trainer.pokemons.create!(name: "Charmander", pokedex_num: 4, fainted: false)
    visit "/trainers/#{trainer.id}/pokemons"
    expect(page).to have_link('Pokemon Index')
  end

  it 'has the parent link on this page' do
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    pokemon = trainer.pokemons.create!(name: "Squirtle", pokedex_num: 7, fainted: false)
    pokemon_2 = trainer.pokemons.create!(name: "Charmander", pokedex_num: 4, fainted: false)
    visit "/trainers/#{trainer.id}/pokemons"
    expect(page).to have_link('Trainer Index')
  end

  it 'has a link taking me to the pokemons belonging to that trainer' do
    # As a visitor
    # When I visit a parent show page ('/parents/:id')
    # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')

    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    trainer_2 = Trainer.create!(name: "Brock", age: 21, all_8_badges: false)

    pokemon = trainer.pokemons.create!(name: "Squirtle", pokedex_num: 7, fainted: false)
    pokemon_2 = trainer.pokemons.create!(name: "Charmander", pokedex_num: 4, fainted: false)
    pokemon_3 = trainer_2.pokemons.create!(name: "Geodude", pokedex_num: 74, fainted: false)
    visit "/trainers/#{trainer.id}/"
    click_link 'Pokemons'
    # save_and_open_page

    expect(page).to have_content(pokemon.name)
    expect(page).to have_content(pokemon_2.name)
    expect(page).to have_no_content(pokemon_3.name)

  end
end
