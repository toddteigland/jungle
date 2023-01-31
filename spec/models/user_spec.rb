require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'Validations' do
      it 'validates a password exists' do
        @user = User.new(name: 'Lewis', email: 'lewishamilton@gmail.com', password: 'password', password_confirmation: 'password')
        puts @user.errors.full_messages
        @user.save
          expect(@user).to be_valid
      end

      it 'validates the password doesn"t match the confirmation' do
        @user = User.new(name: 'Lewis', email: 'lewishamilton@gmail.com', password: 'password', password_confirmation: 'not-password')
        @user.save
          expect(@user).to be_invalid
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'validates a password exists' do
        @user = User.new(name: 'Lewis', email: 'lewishamilton@gmail.com', password: nil)
        @user.save
          expect(@user).to be_invalid
          expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'validates user name exists' do
        @user = User.new(name: nil, email: 'lewishamilton@gmail.com', password: 'password')
        @user.save
          expect(@user).to be_invalid
          expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'validates password is correct length' do
        @user = User.new(name: 'Lewis', email: 'lewishamilton@gmail.com', password: 'tiny')
        @user.save
          expect(@user).to be_invalid
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
    end

    describe 'authenticate_with_credentials' do
      it 'return user if password and email are valid' do
        @user = User.new(name: 'Michael', email: 'Shumacher@f1racing.com', password: 'password', password_confirmation: 'password')
        @user.save
        expect(User.authenticate_with_credentials('Shumacher@f1racing.com', 'password')).to be_truthy
      end
      it 'return nil if password is incorrect' do
        expect(User.authenticate_with_credentials('Shumacher@f1racing.com', 'wrong')).to be_falsy
      end
      it 'return nil if email is not in database' do
        expect(User.authenticate_with_credentials('1@f1racing.com', 'password')).to be_falsy
      end
      it "returns the user if there are spaces around the email" do
        @user = User.new(name: 'Mick', email: ' MickSchumacher@f1racing.com', password: 'password', password_confirmation: 'password')
        @user.save
        expect(User.authenticate_with_credentials(" MickSchumacher@f1racing.com", "password")).to be_truthy
      end

    end


end
