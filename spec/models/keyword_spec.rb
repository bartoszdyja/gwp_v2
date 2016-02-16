require 'rails_helper'

RSpec.describe Keyword do
  describe 'validations' do
    it { is_expected.to validate_presence_of :phrase }
  end

  describe 'db columns' do
    it { is_expected.to have_db_column :phrase }
    it { is_expected.to have_db_column :website_id }
  end

  describe 'attributes' do
    it { is_expected.to respond_to :phrase }
  end

  describe 'associations' do
    it { is_expected.to belong_to :website }
    it { is_expected.to have_many :positions }
  end
end
