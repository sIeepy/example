require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do
  let(:user) { create(:user) }

  it 'user following another user ' do
    jan = FactoryGirl.create(:user, name: 'jan', email: 'jan@wp.pl')
    sign_in user
    expect(user.following.empty?).to be true
    user.follow(jan)
    expect(user.following.count.to_s).to_not be '0'
  end

  it 'user following another user ' do
    jan = FactoryGirl.create(:user, name: 'jan', email: 'jan@wp.pl')
    sign_in user
    expect(user.followers.empty?).to be true
    jan.follow(user)
    expect(user.followers.count.to_s).to_not be '0'
  end
end
