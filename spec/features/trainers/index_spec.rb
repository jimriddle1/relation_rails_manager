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

end
