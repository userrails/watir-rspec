require 'rails_helper'

describe ArticlesController do
  before(:each) do
    @article1 = FactoryGirl.create(:article, name: "article1", address: "address1")
    @article2 = FactoryGirl.create(:article, name: "article2", address: "address2")
  end

  # for index action
  it "it should pass if index calls and loads all articles" do 
    Article.all.should == [@article1, @article2]
    get :index
    response.should be_success
  end

  # for new action
  it "should pass if new action calls with new object" do
    article = FactoryGirl.build(:article)
    Article.stub(:new).and_return(article)
    get :new
    assigns(:article).should == article
  end

  # for create action according to v2
  describe "Post action to article create" do 
    it "should be saved" do
      @article = FactoryGirl.build(:article)
      # @article = Article.new(name: "article1", address: "address1")
      Article.stub(:new).and_return(@article)
      expect{post :create}
    end
  end

# for create action according to v3
describe "POST create" do
  let(:article) { FactoryGirl.create(:article) }

  context "with valid attributes" do
    it "creates a new article" do
      article = FactoryGirl.attributes_for(:article)
      p "------------------------------------------"
      p article
      p "------------------------------------------"
      expect{ post :create, article: article}.to change(Article,:count).by(1)
    end
  end
end 

#example to check for the double method in rspec3
  describe "double" do
    it "raises errors when messages not allowed" do 
      dbl = double("varname", :name => "article1", :address => "address1")
      expect(dbl.name).to eq("article1")
      expect(dbl.address).to eq("address1")
    end
  end

end