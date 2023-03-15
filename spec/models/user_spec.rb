require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should throw an error when password and password_confirmation do not match' do
      @user = User.new(first_name: 'Juju', last_name: 'Sur', email: 'juju@hotmeow.com', password: '1234', password_confirmation: '4321')
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should throw an error when password and password_confirmation are not provided' do
      @user = User.new(first_name: 'Juju', last_name: 'Sur', email: 'juju@hotmeow.com', password: nil, password_confirmation: nil)
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should not save if an unique email is not provide" do
      @user1 = User.new(first_name: 'Juju', last_name: 'Sur', email: 'juju@hotmeow.com', password: '1234', password_confirmation: '1234')
      @user2 = User.new(first_name: 'Juju', last_name: 'Sur', email: 'juju@hotmeow.com', password: '1234', password_confirmation: '1234')
      @user1.save
      @user2.save
      expect(@user2.id).not_to be_present
    end

    it 'should throw an error when email is not provide' do
      @user = User.new(first_name: 'Juju', last_name: 'Sur', email: nil, password: '1234', password_confirmation: '1234')
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should throw an error when first name is not provide' do
      @user = User.new(first_name: nil, last_name: 'Sur', email: 'juju@hotmeow.com', password: '1234', password_confirmation: '1234')
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should throw an error when last name is not provide' do
      @user = User.new(first_name: 'Juju', last_name: nil, email: 'juju@hotmeow.com', password: '1234', password_confirmation: '1234')
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'should throw an error when password does not meet minimum length' do
      @user = User.new(first_name: 'Juju', last_name: 'Sur', email: 'juju@hotmeow.com', password: '12', password_confirmation: '12')
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    end

  end
end
