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

  it 'has the child link on this page' do
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    # pokemon = trainer.pokemons.create!(name: "Squirtle", pokedex_num: 7, fainted: false)
    # pokemon_2 = trainer.pokemons.create!(name: "Charmander", pokedex_num: 4, fainted: false)
    visit "/trainers/#{trainer.id}"
    expect(page).to have_link('Pokemon Index')
  end

  it 'has the parent link on this page' do
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    # pokemon = trainer.pokemons.create!(name: "Squirtle", pokedex_num: 7, fainted: false)
    # pokemon_2 = trainer.pokemons.create!(name: "Charmander", pokedex_num: 4, fainted: false)
    visit "/trainers/#{trainer.id}"
    expect(page).to have_link('Trainer Index')
  end

  it 'updates a trainer' do
    # As a visitor
    # When I visit a parent show page
    # Then I see a link to update the parent "Update Parent"
    # When I click the link "Update Parent"
    # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
    # When I fill out the form with updated information
    # And I click the button to submit the form
    # Then a `PATCH` request is sent to '/parents/:id',
    # the parent's info is updated,
    # and I am redirected to the Parent's Show page where I see the parent's updated info
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    trainer_2 = Trainer.create!(name: "Brock", age: 21, all_8_badges: false)

    pokemon = trainer.pokemons.create!(name: "Squirtle", pokedex_num: 7, fainted: false)
    pokemon_2 = trainer.pokemons.create!(name: "Charmander", pokedex_num: 4, fainted: false)
    pokemon_3 = trainer_2.pokemons.create!(name: "Geodude", pokedex_num: 74, fainted: false)
    visit "/trainers/#{trainer.id}/"

    click_link('Update Trainer')
    expect(current_path).to eq("/trainers/#{trainer.id}/edit")

    fill_in('Name', with: 'Misty')
    fill_in('Age', with: 10)
    uncheck('all_8_badges')
    click_button('Update Trainer')

    expect(page).to have_content("Misty")
    expect(page).to have_no_content(trainer_2.name)
    expect(page).to have_no_content(trainer.name)
  end

  it 'deletes a trainer' do
    # As a visitor
    # When I visit a parent show page
    # Then I see a link to delete the parent
    # When I click the link "Delete Parent"
    # Then a 'DELETE' request is sent to '/parents/:id',
    # the parent is deleted, and all child records are deleted
    # and I am redirected to the parent index page where I no longer see this parent
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    trainer_2 = Trainer.create!(name: "Brock", age: 21, all_8_badges: false)

    visit "/trainers/#{trainer.id}/"

    click_button('Delete Trainer')

    expect(current_path).to eq('/trainers')

    expect(page).to have_no_content("Ash")
    expect(page).to have_content("Brock")


  end


end
