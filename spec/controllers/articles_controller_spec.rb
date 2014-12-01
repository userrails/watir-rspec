require 'spec_helper'

describe ArticlesController do
  before(:each) do
    @article1 = FactoryGirl.create(:article, name: "article1", address: "address1")
    @article2 = FactoryGirl.create(:article, name: "article2", address: "address2")
  end

  # rspec for index action
  it "it should pass if index calls and loads all articles" do 
    Article.all.should == [@article1, @article2]
    get :index, {:params1 => "0123"}
    response.should be_success
  end

  #rspec for new action
  it "should pass if new action calls with new object" do
    article = FactoryGirl.build(:article)
    Article.stub(:new).and_return(article)
    get :new, {:params1 => "0123"}
    assigns(:article).should == article
  end

  

end