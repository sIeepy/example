require 'rails_helper'

RSpec.describe MicropostDecorator do
  let(:micropost) do
    create :micropost,
           created_at: Time.zone.parse('2017-08-13 9:00:00 UTC')
  end

  describe '#creation_date' do
    subject { micropost.decorate.creation_date }
    it { is_expected.to eq '13-08-17 09:00' }
  end

  describe '#post_age' do
    subject { micropost.decorate.post_age }
    it { is_expected.to eq 'New' }
    it { is_expected.to_not eq 'Old' }
  end
end
