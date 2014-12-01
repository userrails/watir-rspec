require 'spec_helper'

describe Article do
   it "validation fails when all fields nil" do
    # below is the rspec 2.0 syntax
    article1 = FactoryGirl.build(:article, name: nil, address: nil)
    article1.should_not be_valid
  end

  it "valids when fields are not blank" do
    # below is the rspec 2.0 syntax
    article2 = FactoryGirl.build(:article, name: "shiv", address: "address 1")
    article2.should be_valid
  end
  
  it "Validates all fields presence when presence true" do
    article3 = FactoryGirl.build(:article)
    # below is the rspec 3.0 syntax
    expect(article3).to be_valid
  end
end