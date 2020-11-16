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
  end
end