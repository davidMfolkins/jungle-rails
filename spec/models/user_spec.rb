require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "should verify that email and name exist" do

      @user = User.new(
        :name => "John",
        :email => "John@john.com",)
      @user.save

      expect(@user.name).to be_present
      expect(@user.email).to be_present
    end

    it "should return the correct error message if passwords do not match" do

      @user = User.new(
        :name => "John",
        :email => "John@john.com",
        :password => "123",
        :password_confirmation => "9")
      @user.save

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should verify that password is atleast 6 characters long" do

      @user = User.new(
        :name => "John",
        :email => "John@john.com",
        :password => "12",
        :password_confirmation => "12")
      @user.save

      expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end

    it "should return the correct error message if email already exists" do

      @user1 = User.new(
        :name => "John",
        :email => "dave@dave.com",
        :password => "123",
        :password_confirmation => "123")
      @user1.save

      @user2 = User.new(
        :name => "John",
        :email => "dave@DAVE.com",
        :password => "123",
        :password_confirmation => "123")
      @user2.save

      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
  end

  describe '.authenticate_with_credentials' do
    
    it "should log in succesfully" do

      @user = User.new(
        :name => "John",
        :email => "john@john.com",
        :password => "123",
        :password_confirmation => "123")
      @user.save

      expect(User.authenticate_with_credentials("john@john.com", "123")).to be_truthy
      

    end

    it "should log in succesfully even with non case sensitivity" do

      @user = User.new(
        :name => "John",
        :email => "john@john.com",
        :password => "123",
        :password_confirmation => "123")
      @user.save

      expect(User.authenticate_with_credentials("JOHN@john.com", "123")).to be_truthy
      

    end

    it "should log in succesfully even with white space" do

      @user = User.new(
        :name => "John",
        :email => "john@john.com",
        :password => "123",
        :password_confirmation => "123")
      @user.save

      expect(User.authenticate_with_credentials("  john@john.com  ", "123")).to be_truthy
      

    end
  end
  
end
