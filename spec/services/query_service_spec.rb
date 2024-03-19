require 'rails_helper'

RSpec.describe QueryService do
  describe '#generate' do
    let(:user) { create(:user) }

    context 'when there are no existing searches' do
      it 'creates a new search' do
        query = 'helpjuice'
        service = QueryService.new(user, query)

        expect { service.generate }.to change { user.searches.count }.from(0).to(1)
        expect(user.searches.last.query).to eq(query)
      end
    end

    context 'when the existing search is not similar' do
      it 'creates a new search' do
        user.searches.create!(query: 'wizardshot')
        query = 'helpjuice'
        service = QueryService.new(user, query)

        expect { service.generate }.to change { user.searches.count }.from(1).to(2)
        expect(user.searches.last.query).to eq(query)
      end
    end

    context 'when the existing search is similar' do
      it 'updates the existing search' do
        existing_search = user.searches.create!(query: 'help')
        query = 'helpjuice'
        service = QueryService.new(user, query)

        expect { service.generate }.not_to(change { user.searches.count })
        expect(user.searches.last.query).to eq(query)
        expect(user.searches.last.updated_at).to be > existing_search.updated_at
      end
    end
  end
end
