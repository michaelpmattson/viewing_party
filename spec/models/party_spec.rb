require 'rails_helper'

RSpec.describe Party, type: :model do
  describeq 'relationships' do
    it { should have_many(:attendees)}
  end
end