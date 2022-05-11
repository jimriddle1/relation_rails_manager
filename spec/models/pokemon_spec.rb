require 'rails_helper'

RSpec.describe Pokemon do
  describe 'relationships' do
    it { should belong_to :trainer }
  end
  describe 'validations' do
  end
end
