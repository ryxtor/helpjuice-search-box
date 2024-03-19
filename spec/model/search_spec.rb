require 'rails_helper'

RSpec.describe Search, type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      assoc = described_class.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end
  end

  describe '.trending' do
    let!(:search1) { create(:search, query: 'helpjuice') }
    let!(:search2) { create(:search, query: 'helpjuice') }
    let!(:search3) { create(:search, query: 'wizardshot') }
    let!(:search4) { create(:search, query: 'rails') }

    it 'returns the top N most frequent search queries' do
      trending_searches = Search.trending.to_a
      expect(trending_searches.size).to eq(3)
      expect(trending_searches.first.query).to eq('helpjuice')
      expect(trending_searches.first.count).to eq(2)
    end

    it 'limits the results to 10' do
      # Create additional searches to test the limit
      11.times { |n| create(:search, query: "unique#{n}") }
      trending_searches = Search.trending.to_a
      expect(trending_searches.size).to eq(10)
    end
  end
end
