require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:cake) { Dessert.new('cake', 5, chef) }
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq('cake')
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { cake.quantity('many') }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      expect(cake.ingredients).to_not include('fish')
      cake.add_ingredient('fish')
      expect(cake.ingredients).to include('fish')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      cake.add_ingredient('pepper')
      cake.add_ingredient('fish')
      cake.mix!
      expect(cake.ingredients).to match_array(['fish', 'pepper'])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(cake.quantity).to_not eq(4)
      cake.eat(1)
      expect(cake.quantity).to eq(4)
    end

    it "raises an error if the amount is greater than the quantity" do 
      expect { cake.quantity(6) }.to raise_error(ArgumentError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      expect(chef).to receive(:titleize)
      cake.serve
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(chef).to receive(:bake).with(cake)
      cake.make_more
    end
  end
end
