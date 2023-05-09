require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'checks if valid user created and saved successfully' do
      @user = User.create(first_name: 'Linxue', last_name: 'Ren', email: 'linxueren@mail.com', password: 'password', password_confirmation: 'password')

      expect(@user).to be_valid
    end

    it 'throws an error First name cant be blank without first name' do
      @user = User.create(last_name: 'Ren', email: 'linxueren@mail.com', password: 'password', password_confirmation: 'password')
      expect(@user).to_not be_valid
      expect(@user.errors.messages[:first_name]).to include "can't be blank"

    end
    it 'throws an error Last name cant be blank without last name' do
      @user = User.create(first_name: 'Linxue', email: 'linxueren@mail.com', password: 'password', password_confirmation: 'password')
      expect(@user).to_not be_valid
      expect(@user.errors.messages[:last_name]).to include "can't be blank"

    end
    it 'throws an error password cant be blank without password' do
      @user = User.create(first_name: 'Linxue', last_name: 'Ren', email: 'linxueren@mail.com', password_confirmation: 'password')
      expect(@user).to_not be_valid
      expect(@user.errors.messages[:password]).to include "can't be blank"

    end

    it 'throws an error Password confrimation cant be blank without password confirmation' do
      @user = User.create(first_name: 'Linxue', last_name: 'Ren', email: 'linxueren@mail.com', password: 'password')
      expect(@user).to_not be_valid
      expect(@user.errors.messages[:password_confirmation]).to include "can't be blank"

    end
    it 'throws an error Email cant be blank without email' do
      @user = User.create(first_name: 'Linxue', last_name: 'Ren', password: 'password', password_confirmation: 'password')
      expect(@user).to_not be_valid
      expect(@user.errors.messages[:email]).to include "can't be blank"

    end

    it 'checks password\'s length, throws an error if password too short' do
      @user = User.create(first_name: 'Linxue', last_name: 'Ren', email: 'linxueren@mail.com', password: '123', password_confirmation: '123')

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages[0]).to include "is too short (minimum is 8 characters)"
    end

    it 'checks if password and password_confirmation are same, throws an error if password confirmation does not match password' do
      @user = User.create(first_name: 'Linxue', last_name: 'Ren', email: 'linxueren@mail.com', password: 'password', password_confirmation: 'PASSWORD')

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages[0]).to include "doesn't match"
    end
    
    it 'checks if email is unique, throws an error if email has already been taken' do
      @user1 = User.create(first_name: 'Linxue', last_name: 'Ren', email: 'linxueren@mail.com', password: 'password', password_confirmation: 'password')
      
      @user2 = User.create(first_name: 'Linxue', last_name: 'Ren', email: 'linxueren@mail.com', password: 'password', password_confirmation: 'password')
      
      expect(@user1).to be_valid
      expect(@user2).to_not be_valid
      
      expect(@user2.errors.messages[:email]).to include "has already been taken"
      
    end
    
    it 'checks email without case sensitive' do
      @user1 = User.create(first_name: 'Linxue', last_name: 'Ren', email: 'linxueren@mail.com', password: 'password', password_confirmation: 'password')

      @user2 = User.create(first_name: 'Linxue', last_name: 'Ren', email: 'LINXUEREN@mail.com', password: 'password', password_confirmation: 'password')

      expect(@user1).to be_valid
      expect(@user2).to_not be_valid

      expect(@user2.errors.messages[:email]).to include "has already been taken"
    end
  end

  # authenicate

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.create(first_name: 'Linxue', last_name: 'Ren', email: 'linxueren@mail.com', password: 'password', password_confirmation: 'password')
    end

   it 'returns a user with matching email and password' do

    expect(User.authenticate_with_credentials('linxueren@mail.com', 'password')).to eq @user

   end

   it 'return nil with unmatching email and password' do

    expect(User.authenticate_with_credentials('linxueren@mail.com', '123')).to eq nil

    expect(User.authenticate_with_credentials('linxue@mail.com', 'password')).to eq nil

   end

   it 'returns a user with matching email and password in upper case' do

    expect(User.authenticate_with_credentials('LINXUEREN@mail.com', 'password')).to eq @user


   end

   it 'returns a user with matching email with spaces and password' do

    expect(User.authenticate_with_credentials('   linxueren@mail.com', 'password')).to eq @user

   end

  end

end
