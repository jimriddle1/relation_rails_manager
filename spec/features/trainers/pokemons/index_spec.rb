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
    save_and_open_page
    expect(page).to have_content(pokemon.name)
    expect(page).to have_content(pokemon_2.name)
  end
end
