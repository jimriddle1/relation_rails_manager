require 'rails_helper'

RSpec.describe 'the trainers show page' do
  it 'displays the trainer ids' do
#     As a visitor
#   When I visit '/parents/:id'
#   Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table
    pokemon = Pokemon.create(name: "Squirttle", level: 4, fainted: false)
    trainer = Trainer.create(name: "Jim", age: 31, all_8_badges: false)
    visit "/trainers/#{trainer.id}"
  end

  it 'displays the name of the artist for the song' do

  end
end
