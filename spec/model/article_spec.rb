require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      article = build(:article)
      expect(article).to be_valid
    end

    it 'is not valid without a title' do
      article = build(:article, title: nil)
      expect(article).not_to be_valid
    end

    it 'is not valid without content' do
      article = build(:article, content: nil)
      expect(article).not_to be_valid
    end
  end

  describe '.by_title' do
    let!(:article1) { create(:article, title: 'Helpjuice') }
    let!(:article2) { create(:article, title: 'Wizardshot from Helpjuice') }
    let!(:article3) { create(:article, title: 'Wizardshot') }

    it 'returns articles that match the search term case-insensitively' do
      expect(Article.by_title('helpjuice')).to contain_exactly(article1, article2)
    end

    it 'returns an empty collection when no titles match' do
      expect(Article.by_title('rails')).to be_empty
    end
  end
end
