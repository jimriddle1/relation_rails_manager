require 'rails_helper'

RSpec.describe Pokemon do
  describe 'relationships' do
    it { should belong_to :trainer }
  end
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :pokedex_num }
    it { should allow_value(true).for(:fainted) }
    it { should allow_value(false).for(:fainted) }
  end
end
