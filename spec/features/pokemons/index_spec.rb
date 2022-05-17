require 'rails_helper'

RSpec.describe 'the pokemons index page' do
  it 'displays the attrs of each pokemon' do
    # As a visitor
    # When I visit '/child_table_name'
    # Then I see each Child in the system including the Child's attributes:
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    pokemon = trainer.pokemons.create!(name: "Squirtle", pokedex_num: 7, fainted: true)
    pokemon_2 = trainer.pokemons.create!(name: "Charmander", pokedex_num: 4, fainted: true)
    # binding.pry
    visit "/pokemons"
    # save_and_open_page
    expect(page).to have_content(pokemon.name)
    expect(page).to have_content(pokemon.pokedex_num)
    expect(page).to have_content(pokemon.fainted)
    expect(page).to have_content(pokemon_2.name)
    expect(page).to have_content(pokemon_2.pokedex_num)
    expect(page).to have_content(pokemon_2.fainted)
  end

  it 'has the child link on this page' do
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    visit "/pokemons/"
    expect(page).to have_link('Pokemon Index')
  end

  it 'has the parent link on this page' do
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
    visit "/pokemons/"
    expect(page).to have_link('Trainer Index')
  end

  it 'only displays pokemon that are fainted' do
    # As a visitor
    # When I visit the child index
    # Then I only see records where the boolean column is `true`
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    pokemon = trainer.pokemons.create!(name: "Squirtle", pokedex_num: 7, fainted: true)
    pokemon_2 = trainer.pokemons.create!(name: "Charmander", pokedex_num: 4, fainted: true)
    pokemon_3 = trainer.pokemons.create!(name: "Bulbasaur", pokedex_num: 1, fainted: false)

    visit "/pokemons"

    expect(page).to have_content(pokemon.name)
    expect(page).to have_content(pokemon_2.name)
    expect(page).to have_no_content(pokemon_3.name)


  end

  it 'can have buttons to edit each of the pokemons' do
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    pokemon = trainer.pokemons.create!(name: "Squirtle", pokedex_num: 7, fainted: false)
    pokemon_2 = trainer.pokemons.create!(name: "Charmander", pokedex_num: 4, fainted: true)
    pokemon_3 = trainer.pokemons.create!(name: "Bulbasaur", pokedex_num: 1, fainted: true)

    visit "pokemons"

    expect(page).to have_no_link('Update Squirtle')
    expect(page).to have_link('Update Charmander')
    expect(page).to have_link('Update Bulbasaur')
    click_link('Update Charmander')
    expect(current_path).to eq("/pokemons/#{pokemon_2.id}/edit")
    expect(page).to have_button('Update Pokemon')

    # save_and_open_page

  end

end
