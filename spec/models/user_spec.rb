require 'rails_helper'

RSpec.describe User, type: :model do
  #What to test?
    #Validations
    #Associations
    #Class Methods
    #Error Messages

    subject(:user) { User.new(username: 'lola', password: '123456') }

    describe 'validation' do
      it { should validate_presence_of(:username) }
      it { should validate_presence_of(:password_digest) }
      it { should validate_presence_of(:session_token) }
      it { should validate_uniqueness_of(:username) }
      it { should validate_uniqueness_of(:session_token) }
    end

    describe 'class methods' do
      describe '::find_by_credentials' do
        it 'finds a user by a username and password' do
          user1 = User.create(username: 'ken', password: '123456')
          expect(User.find_by_credentials('ken', '123456')).to eq(user1)
        end
      end
    end

    describe 'error messages'
end
