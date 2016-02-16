require 'rails_helper'

RSpec.describe Position do
  describe 'validations' do
    it { is_expected.to validate_presence_of :rank }
  end

  describe 'db columns' do
    it { is_expected.to have_db_column :rank }
    it { is_expected.to have_db_column :keyword_id }
  end

  describe 'attributes' do
    it { is_expected.to respond_to :rank }
  end

  describe 'associations' do
    it { is_expected.to belong_to :keyword }
  end

  describe 'methods' do
    let(:position) { Position.create(rank: 0) }
    it 'should return formatted rank' do
      expect(position).to be_valid
      expect(position.formatted_rank).to eq 1
    end

    it 'should return formatted creation date' do
      expect(position.formatted_creation_date).to eq 'less than a minute ago'
    end
  end
end
