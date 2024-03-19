require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }

  before do
    # Creating different search queries with varying frequencies
    10.times { user2.searches.create(query: 'helpjuice') }
    8.times { user.searches.create(query: 'wizardshot') }
    5.times { user.searches.create(query: 'rails') }
    3.times { user.searches.create(query: 'ruby') }
    2.times { user.searches.create(query: 'python') }
    2.times { user.searches.create(query: 'javascript') }
    2.times { user.searches.create(query: 'react') }
    2.times { user.searches.create(query: 'vue') }
    2.times { user.searches.create(query: 'docker') }
    2.times { user.searches.create(query: 'tailwind') }
    2.times { user.searches.create(query: 'elixir') }

    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'GET #index' do
    it 'returns the top 10 most frequent search queries' do
      get :index
      expect(assigns(:trending).to_a.size).to be <= 10
      expect(assigns(:trending).first.query).to eq('helpjuice')
      expect(assigns(:trending).first.count).to eq(10)
      expect(assigns(:trending).second.query).to eq('wizardshot')
      expect(assigns(:trending).third.query).to eq('rails')
    end
  end

  describe 'GET #search_history' do
    it 'returns the first user search history' do
      get :search_history
      expect(assigns(:searches).size).to eq(30)
      expect(assigns(:searches).first.query).to eq('elixir')
      expect(assigns(:searches).last.query).to eq('wizardshot')
    end
  end
end
