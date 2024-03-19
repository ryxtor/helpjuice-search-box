require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:user) }

    it 'is valid with a unique ip_address' do
      expect(subject).to be_valid
    end

    it 'is not valid without an ip_address' do
      subject.ip_address = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:ip_address]).to include("can't be blank")
    end

    it 'is not valid with a duplicate ip_address' do
      existing_user = FactoryBot.create(:user)
      subject.ip_address = existing_user.ip_address
      expect(subject).not_to be_valid
      expect(subject.errors[:ip_address]).to include('has already been taken')
    end
  end

  describe 'associations' do
    it 'has many searches' do
      assoc = described_class.reflect_on_association(:searches)
      expect(assoc.macro).to eq :has_many
    end
  end
end
