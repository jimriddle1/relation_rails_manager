require 'rails_helper'

RSpec.describe 'the trainers show page' do
  it 'displays the trainer name' do
    trainer = Trainer.create(name: "Jim", age: 31, all_8_badges: false)
    visit "/trainers/#{trainer.id}"
  end

  it 'displays the name of the artist for the song' do

  end
end
