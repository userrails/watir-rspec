require 'spec_helper'

describe Article do
  # test for presence true for rspec 2.0 syntax
   it "validation fails when all fields nil" do
    # below is the rspec 2.0 syntax
    article1 = FactoryGirl.build(:article, name: nil, address: nil)
    article1.should_not be_valid
  end

  # test for prsence true for rspec 2.0 syntax
  it "valids when fields are not blank" do
    # below is the rspec 2.0 syntax
    article2 = FactoryGirl.build(:article, name: "article1", address: "address 1")
    article2.should be_valid
  end
  
  # test for presence true for rspec 3.0 syntax
  it "validates all fields presence when presence true" do
    article3 = FactoryGirl.build(:article)
    # below is the rspec 3.0 syntax
    expect(article3).to be_valid
  end

  # make validation fails for uniqueness for the article name, this will through the error with validation not passed
  it "validation pass when article name is unique" do
    article4 = FactoryGirl.build(:article, name: "article1")
    p "-------------------------------------------"
    p article4.name
    p "-------------------------------------------"
    Article.create(:name => article4.name)
    article4.should_not be_valid
  end

  # make validation pass for uniqueness for the article name
  it "validation pass when article name are different" do 
    article5 = FactoryGirl.build(:article, name: "article1")
    Article.create(:name => "article2")
    article5.should be_valid
  end

  # Validation should pass when article name is capitalize with rspec 2.0
  it "Validation should pass when article name is capitalize" do
    article6 = FactoryGirl.build(:article, name: "article1")
    article6.name == "Article1"
  end

  # Validation should pass when article name is capitalize with rspec 3.0
  it "on article name capital validation should pass" do
    article7 = FactoryGirl.build(:article, name: "article1")
    expect(article7.name) == "Article1"
  end  
end