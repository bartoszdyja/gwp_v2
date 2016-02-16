require 'rails_helper'

RSpec.describe Account do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
  end

  describe 'db columns' do
    it { is_expected.to have_db_column :name }
  end

  describe 'attributes' do
    it { is_expected.to respond_to :name }
  end

  it { is_expected.to have_many :websites }
end
