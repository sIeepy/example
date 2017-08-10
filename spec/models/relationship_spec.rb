require 'rails_helper'

RSpec.describe Relationship, type: :model do

  it { is_expected.to validate_presence_of :follower_id }
  it { is_expected.to validate_presence_of :followed_id }
  it { is_expected.to belong_to :follower }
  it { is_expected.to belong_to :followed }

  it "should follow and unfollow user" do
    jan = FactoryGirl.create(:user, name: 'jan')
    arek = FactoryGirl.create(:user, name: 'arek')

    expect(arek.following?(jan)).to_not be true
    arek.follow(jan)
    expect(arek.following?(jan)).to be true
    expect(jan.followers.include?(arek)).to be true
    arek.unfollow(jan)
    expect(arek.following?(jan)).to_not be true
  end
end
