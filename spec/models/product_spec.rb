require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save a product with all four required fields set' do
      @category = Category.new(name: 'Unique')
      @product = Product.new(name: "Juju's Fang", price: 740, quantity: 3, category: @category)
      expect(@product).to be_valid
      # Passes if the given model instance's valid? method is true, 
      # meaning all of the ActiveModel::Validations passed and no errors exist.
    end

    it 'should throw an error when name is not provided' do
      @category = Category.new(name: 'Unique')
      @product = Product.new(name: nil, price: 740, quantity: 3, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should throw an error when price is not provided' do
      @category = Category.new(name: 'Unique')
      @product = Product.new(name: "Juju's Fang", quantity: 3, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should throw an error when quantity is not provided' do
      @category = Category.new(name: 'Unique')
      @product = Product.new(name: "Juju's Fang", price: 740, quantity: nil, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should throw an error when category is not provided' do
      @product = Product.new(name: "Juju's Fang", price: 740, quantity: 3, category: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
