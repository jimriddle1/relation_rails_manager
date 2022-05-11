require 'rails_helper'

RSpec.describe 'the trainers show page' do
  it 'displays the names of each trainer' do
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    # Then I see the name of each parent record in the system
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    trainer_2 = Trainer.create!(name: "Brock", age: 21, all_8_badges: false)
    visit "/trainers"
    # save_and_open_page
    expect(page).to have_content(trainer.name)
    expect(page).to have_content(trainer_2.name)
  end



  # it 'displays the name of the artist for the song' do
  #
  #   pokemon = trainer.pokemons.create!(name: "Squirtle", level: 12, fainted: false)
  #   binding.pry
  #   # pokemon_2 = trainers.pokemons.create!(name: "Charmander", level: 6, fainted: false)
  #   visit "/trainers/#{trainer.id}"
  #   expect(page).to have_content(pokemon.name)
  #   expect(page).to_not have_content(pokemon_2.title)
  # end
end
