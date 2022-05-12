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

  it 'displays the trainers in order by creation date' do
    # As a visitor
    # When I visit the parent index,
    # I see that records are ordered by most recently created first
    # And next to each of the records I see when it was created

    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    trainer_2 = Trainer.create!(name: "Brock", age: 21, all_8_badges: false)
    visit "/trainers"

    expect(trainer.name).to appear_before(trainer_2.name)
  end

  it 'has the child link on this page' do
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    visit "/trainers/"
    expect(page).to have_link('Pokemon Index')
  end
end
