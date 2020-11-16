require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfully with all four fields set' do

      @category = Category.new(:name => "test")
      @product = Product.new( 
        :name => "Hello",
        :category => @category,
        :quantity => "1",
        :price => "1.00")
      @product.save!

    end

    it 'should return the correct error message if name is nil' do
      
      @category = Category.new(:name => "test")
      @product = Product.new( 
        :name => nil,
        :category => @category,
        :quantity => "1",
        :price => "1.00")
      @product.save

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should return the correct error message if price is nil' do
      
      @category = Category.new(:name => "test")
      @product = Product.new( 
        :name => "Hello",
        :category => @category,
        :quantity => "1",
        :price => nil)
      @product.save

      expect(@product.errors.full_messages).to include("Price cents is not a number", "Price is not a number", "Price can't be blank")
    end

    it 'should return the correct error message if quantity is nil' do
      
      @category = Category.new(:name => "test")
      @product = Product.new( 
        :name => "Hello",
        :category => @category,
        :quantity => nil,
        :price => "1.00")
      @product.save

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should return the correct error message if category is nil' do
      
      @category = Category.new(:name => "test")
      @product = Product.new( 
        :name => "Hello",
        :category => nil,
        :quantity => "1",
        :price => "1.00")
      @product.save

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end