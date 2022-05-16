require 'rails_helper'

RSpec.describe 'the trainers index page' do
  it 'displays the names of each trainer' do
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    # Then I see the name of each parent record in the system
    # binding.pry
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    trainer_2 = Trainer.create!(name: "Brock", age: 21, all_8_badges: false)
    visit "/trainers"
    # save_and_open_page
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

    # save_and_open_page
    fill_in('Name', with: 'Misty')
    fill_in('Age', with: 10)
    uncheck('all_8_badges')
    click_button('Create Trainer')

    # save_and_open_page
    expect(current_path).to eq("/trainers")
    expect(page).to have_content("Misty")

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
end
