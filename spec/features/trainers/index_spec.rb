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
end
