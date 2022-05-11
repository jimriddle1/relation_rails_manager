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
end
