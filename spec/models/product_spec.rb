require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'ensures that a product with all four fields set will indeed save successfully' do
    @category = Category.create(name: 'Flower')
    @product = Product.create(name: 'Rosemary', category: @category, quantity: 1, price: 30)
    expect(@product.save!).to be true
    expect(@product).to be_valid
    end

    it 'throws an error Name cant be blank without a name' do
      @category = Category.create(name: 'Flower')
      @product = Product.create(category: @category, quantity: 1, price: 30)
      expect(@product.errors.full_messages[0]).to eq "Name can't be blank"
    end

    it 'throws an error Quantity cant be blank without a quantity' do
      @category = Category.create(name: 'Flower')
      @product = Product.create(name: 'Rosemary', category: @category, price: 30)
      expect(@product.errors.full_messages[0]).to eq "Quantity can't be blank"
    end

    it 'throws an error Category must exist without a category' do
      @product = Product.create(name: 'Rosemary', quantity: 1, price: 30)
      expect(@product.errors.full_messages[0]).to eq "Category must exist"
    end

    it 'throws an error Price cents is not a number without a price' do
      @category = Category.create(name: 'Flower')
      @product = Product.create(name: 'Rosemary', category: @category, quantity: 1)
      expect(@product).to_not be_valid
     expect(@product.errors.full_messages[0]).to eq "Price cents is not a number"
    end

  end
end
