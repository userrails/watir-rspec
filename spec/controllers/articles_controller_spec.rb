require 'spec_helper'

describe ArticlesController do
  before(:each) do
    article1 = FactoryGirl.create(:article, name: "article1", address: "address1")
    article2 = FactoryGirl.create(:article, name: "article2", address: "address2")
  end
end