require 'rails_helper'

RSpec.describe Trainer do
  describe 'relationships' do
    it { should have_many :pokemons }
  end
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should allow_value(true).for(:all_8_badges) }
    it { should allow_value(false).for(:all_8_badges) }
  end

  it 'displays the trainers in order by creation date desc order' do
    # As a visitor
    # When I visit the parent index,
    # I see that records are ordered by most recently created first
    # And next to each of the records I see when it was created

    trainer = Trainer.create!(name: "Ash", age: 18, all_8_badges: false)
    trainer_2 = Trainer.create!(name: "Brock", age: 21, all_8_badges: false)


    expect(Trainer.trainers_in_order).to eq([trainer_2, trainer])
  end
end
