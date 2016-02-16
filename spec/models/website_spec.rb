require 'rails_helper'

RSpec.describe Website do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :url }
  end

  describe 'db columns' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :url }
  end

  describe 'attributes' do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :url }
    it { is_expected.to respond_to :check_url }
    it { is_expected.to respond_to :check_status }
  end

  describe 'associations' do
    it { is_expected.to belong_to :account }
    it { is_expected.to have_many :keywords }
  end
end
