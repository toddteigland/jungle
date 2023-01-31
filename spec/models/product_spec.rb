require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'validates the name' do
      @category = Category.new(name: 'bob')
      @product = Product.new(name: 'flower', price: 40, quantity: 4, category: @category)
      @product.save
        expect(@product).to be_valid
  
    end
  end
  describe 'Validations' do
    it 'doesnt validate the name' do
      @category = Category.new(name: 'bob')
      @product = Product.new(name: nil, price: 40, quantity: 4, category: @category)
      @product.save
        expect(@product).to be_invalid
        expect(@product.errors.full_messages).to include("Name can't be blank")
  
    end
  end
  describe 'Validations' do
    it 'doesnt validate the price' do
      @category = Category.new(name: 'bob')
      @product = Product.new(name: 'flower', price: nil, quantity: 4, category: @category)
      @product.save
        expect(@product).to be_invalid
        expect(@product.errors.full_messages).to include("Price cents can't be blank")
  
    end
  end
  describe 'Validations' do
    it 'doesnt validate the quantity' do
      @category = Category.new(name: 'bob')
      @product = Product.new(name: 'flower', price: 40, quantity: nil, category: @category)
      @product.save
        expect(@product).to be_invalid
        expect(@product.errors.full_messages).to include("Quantity can't be blank")

  
    end
  end
  describe 'Validations' do
    it 'doesnt validate the category' do
      @category = Category.new(name: 'bob')
      @product = Product.new(name: 'flower', price: 40, quantity: 4, category: nil)
      @product.save
        expect(@product).to be_invalid
        expect(@product.errors.full_messages).to include("Category can't be blank")

  
    end
  end
end