require 'rails_helper'

feature 'searching' do
  context 'user searching for other users' do
    it 'search for other user' do
      desired_item = create(:user)
      other_item = create(:user)
      expect(User.all_except(other_item.id).search(desired_item.name)).to eq [desired_item]
    end

    it 'search for yourself' do
      other_item = create(:user)
      expect(User.all_except(other_item.id).search(other_item.name)).to_not eq [other_item]
    end
  end
end
