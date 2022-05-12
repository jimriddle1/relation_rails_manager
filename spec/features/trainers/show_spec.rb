require 'rails_helper'

RSpec.describe 'the trainers show page' do
  it 'displays the attrs of a specific trainer' do
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    # Then I see the name of each parent record in the system
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    # trainer_2 = Trainer.create!(name: "Brock", age: 21, all_8_badges: false)
    visit "/trainers/#{trainer.id}"
    # save_and_open_page
    expect(page).to have_content(trainer.name)
    expect(page).to have_content(trainer.age)
    expect(page).to have_content(trainer.all_8_badges)
    # expect(page).to have_content(trainer_2.name)
  end

  it 'gives me the count of pokemons of a specific trainer' do
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    pokemon = trainer.pokemons.create!(name: "Squirtle", pokedex_num: 7, fainted: false)
    pokemon_2 = trainer.pokemons.create!(name: "Charmander", pokedex_num: 4, fainted: false)
    visit "/trainers/#{trainer.id}"

    expect(page).to have_content(trainer.pokemons.count)
    #either work
    # expect(page).to have_content(2)
  end


end
