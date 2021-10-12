require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:friendships) }
    it { should have_many(:attendees) }
    it { should have_many(:parties).through(:attendees)}
  end
end
