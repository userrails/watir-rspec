require 'rails_helper'

RSpec.describe Category, :type => :model do
  describe "validation" do
    it { should validate_presence_of :name }

    it "fails when all field vaccant" do
      @category = FactoryGirl.build(:category, name: nil)
      @category.should_not be_valid
    end

    it "pass when all fields are not nil" do
      @category = FactoryGirl.build(:category)
      @category.should be_valid
    end

    it { should validate_uniqueness_of :name }

    # it "fails when fields are unique" do
    #   @category = FactoryGirl.build(:category)
    #   @category1 = FactoryGirl.create(:category, :name => @category.name)
    #   @category1.should_not be_valid
    # end

    it "pass when fields are unique" do
      @category = FactoryGirl.build(:category)
      @category1 = FactoryGirl.create(:category, :name => "category 2")
      @category1.should be_valid
    end

    it "should pass when category name is capital" do
      #expectation // should||should_not be_valid
      @category = FactoryGirl.build(:category)
      expect(@category.name == "Category 1")      
    end    
  end
end