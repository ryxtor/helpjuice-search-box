require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET #index' do
    let!(:articles) { create_list(:article, 3) }

    context 'when no search parameter is provided' do
      it 'assigns all articles as @articles' do
        get :index
        expect(assigns(:articles)).to match_array(articles)
      end
    end

    context 'when search parameter is provided' do
      let(:searched_articles) { create_list(:article, 2, title: 'Specific Title') }
      let(:user) { create(:user) }
      let(:search_param) { 'Specific Title' }

      before do
        allow(controller).to receive(:current_user).and_return(user)
        allow(QueryService).to receive(:new).with(user, search_param).and_call_original
      end

      it 'calls the QueryService' do
        get :index, params: { search: search_param }
        expect(QueryService).to have_received(:new).with(user, search_param)
      end

      it 'assigns the searched articles as @articles' do
        get :index, params: { search: search_param }
        expect(assigns(:articles)).to match_array(searched_articles)
      end
    end
  end
end
