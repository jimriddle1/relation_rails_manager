require 'rails_helper'

RSpec.describe 'the trainers index page' do
  it 'displays the names of each trainer' do
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    # Then I see the name of each parent record in the system
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    trainer_2 = Trainer.create!(name: "Brock", age: 21, all_8_badges: false)

    visit "/trainers"
    expect(page).to have_content(trainer.name)
    expect(page).to have_content(trainer_2.name)
  end

  it 'displays the trainers in order by creation date desc order' do
    # As a visitor
    # When I visit the parent index,
    # I see that records are ordered by most recently created first
    # And next to each of the records I see when it was created
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    trainer_2 = Trainer.create!(name: "Brock", age: 21, all_8_badges: false)

    visit "/trainers"
    expect(trainer_2.name).to appear_before(trainer.name)
  end

  it 'has the child link on this page' do
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)

    visit "/trainers/"
    expect(page).to have_link('Pokemon Index')
  end

  it 'has the parent link on this page' do
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)

    visit "/trainers/"
    expect(page).to have_link('Trainer Index')
  end

  it 'can create a new trainer' do
    # As a visitor
    # When I visit the Parent Index page
    # Then I see a link to create a new Parent record, "New Parent"
    # When I click this link
    # Then I am taken to '/parents/new' where I  see a form for a new parent record
    # When I fill out the form with a new parent's attributes:
    # And I click the button "Create Parent" to submit the form
    # Then a `POST` request is sent to the '/parents' route,
    # a new parent record is created,
    # and I am redirected to the Parent Index page where I see the new Parent displayed.
    visit '/trainers'

    click_link('New Trainer')
    expect(current_path).to eq('/trainers/new')

    fill_in('Name', with: 'Misty')
    fill_in('Age', with: 10)
    uncheck('all_8_badges')
    click_button('Create Trainer')

    expect(current_path).to eq("/trainers")
    expect(page).to have_content("Misty")

  end

  it 'can have buttons to edit each of the trainers' do
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    trainer_2 = Trainer.create!(name: "Brock", age: 21, all_8_badges: false)
    visit "/trainers"

    expect(page).to have_link('Update Ash')
    expect(page).to have_link('Update Brock')
    click_link('Update Ash')
    expect(current_path).to eq("/trainers/#{trainer.id}/edit")
    expect(page).to have_button('Update Trainer')
  end

  it 'can have links to delete each of the trainers' do
    # As a visitor
    # When I visit the parent index page
    # Next to every parent, I see a link to delete that parent
    # When I click the link
    # I am returned to the Parent Index Page where I no longer see that parent
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    trainer_2 = Trainer.create!(name: "Brock", age: 21, all_8_badges: false)
    visit "/trainers"

    expect(page).to have_link('Delete Ash')
    expect(page).to have_link('Delete Brock')
    click_link('Delete Ash')
    expect(current_path).to eq("/trainers")
    expect(page).to have_no_content(trainer.name)
    expect(page).to have_content(trainer_2.name)
  end

  it 'gives me the trainers in order by pokemon count when i click the link' do
    # As a visitor
    # When I visit the Parents Index Page
    # Then I see a link to sort parents by the number of `child_table_name` they have
    # When I click on the link
    # I'm taken back to the Parent Index Page where I see all of the parents in order of their count of `child_table_name` (highest to lowest) And, I see the number of children next to each parent name
    trainer_2 = Trainer.create!(name: "Misty", age: 10, all_8_badges: false)
    trainer = Trainer.create!(name: "Ash", age: 11, all_8_badges: false)
    pokemon = trainer.pokemons.create!(name: "Squirtle", pokedex_num: 7, fainted: false)
    pokemon_2 = trainer.pokemons.create!(name: "Charmander", pokedex_num: 4, fainted: false)
    pokemon_3 = trainer_2.pokemons.create!(name: "Bulbasaur", pokedex_num: 1, fainted: false)
    pokemon_4 = trainer_2.pokemons.create!(name: "Starmie", pokedex_num: 122, fainted: false)
    pokemon_5 = trainer_2.pokemons.create!(name: "Goldeen", pokedex_num: 120, fainted: false)

    visit "/trainers"
    expect(trainer.name).to appear_before(trainer_2.name)
    #default is sorted by creation date newest to oldest

    click_link('Sort by Pokemon Count')
    expect(trainer_2.name).to appear_before(trainer.name)
  end

end
