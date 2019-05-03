# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(email: 'pondo', password: 'password') }

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'class methods' do
    describe '#is_password?' do
      it 'returns true for a valid password' do
        expect(user.is_password?(user.password)).to be true
      end

      it 'returns false for an invalid password' do
        expect(user.is_password?('short')).to be false
      end
    end

    describe '#reset_session_token!' do
      it 'gives the user a new session token' do
        user.valid?
        current_token = user.session_token
        user.reset_session_token!
        expect(user.reset_session_token!).to_not eq(current_token)
      end

      it 'returns the new token' do
        expect(user.reset_session_token!).to eq(user.session_token)
      end
    end

    describe '::find_by_credentials' do
      it 'returns the user if the credentials are valid' do
        user.save!
        expect(User.find_by_credentials('pondo', 'password')).to eq(user)
      end

      it 'returns nil if the credentials are invalid' do
        user.save!
        expect(User.find_by_credentials('pondo', '')).to eq(nil)
      end
    end
  end
end
