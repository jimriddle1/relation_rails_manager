require 'rails_helper'

RSpec.describe 'the pokemons show page' do
  it 'displays the attrs of a specific pokemon' do
    # For each parent table
    # As a visitor
    # When I visit ''/child_table_name/:id'
    # Then I see the child with that id including the child's attributes
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    pokemon = trainer.pokemons.create!(name: "Squirtle", pokedex_num: 7, fainted: false)
    # pokemon_2 = trainer.pokemons.create!(name: "Charmander", level: 6, fainted: false)
    # trainer_2 = Trainer.create!(name: "Brock", age: 21, all_8_badges: false)
    visit "/pokemons/#{pokemon.id}"
    # save_and_open_page
    expect(page).to have_content(pokemon.name)
    expect(page).to have_content(pokemon.pokedex_num)
    expect(page).to have_content(pokemon.fainted)
  end

  it 'has the child link on this page' do
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    pokemon = trainer.pokemons.create!(name: "Squirtle", pokedex_num: 7, fainted: false)
    visit "/pokemons/#{pokemon.id}"
    expect(page).to have_link('Pokemon Index')
  end

  it 'has the parent link on this page' do
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    pokemon = trainer.pokemons.create!(name: "Squirtle", pokedex_num: 7, fainted: false)
    visit "/pokemons/#{pokemon.id}"
    expect(page).to have_link('Trainer Index')
  end

  it 'can update the pokemon' do
    # As a visitor
    # When I visit a Child Show page
    # Then I see a link to update that Child "Update Child"
    # When I click the link
    # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
    # When I click the button to submit the form "Update Child"
    # Then a `PATCH` request is sent to '/child_table_name/:id',
    # the child's data is updated,
    # and I am redirected to the Child Show page where I see the Child's updated information
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    pokemon = trainer.pokemons.create!(name: "Squirtle", pokedex_num: 7, fainted: false)
    visit "/pokemons/#{pokemon.id}"

    click_link('Update Pokemon')
    expect(current_path).to eq("/pokemons/#{pokemon.id}/edit")

    fill_in('Name', with: 'Wartortle')
    fill_in('pokedex_num', with: 8)
    uncheck('fainted')
    click_button('Update Pokemon')

    expect(page).to have_content("Wartortle")
    expect(page).to have_no_content(pokemon.name)
  end
end
