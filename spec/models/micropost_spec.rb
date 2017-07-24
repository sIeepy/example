require 'rails_helper'

RSpec.describe Micropost, type: :model do

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:content) }
  it { should validate_length_of(:content).is_at_most(140) }
  it { is_expected.to belong_to :user }

  it "should return posts in the correct order" do
    @older_post = FactoryGirl.create(:micropost, created_at: 1.day.ago)
    @newer_post = FactoryGirl.create(:micropost, created_at: 1.hour.ago)
    Micropost.all.should == [@newer_post, @older_post]
  end
end
