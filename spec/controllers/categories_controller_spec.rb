require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do
 before(:each) do
  @category1 = FactoryGirl.create(:category, name: "category 2")
  @category2 = FactoryGirl.create(:category, name: "category 3")
 end

 describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    # it loads @cat1, @cat2 in @categories
   it "should pass if loads all of the categories into @categories" do
    get :index
    expect(assigns(:categories)).to match_array([@category1, @category2])
   end
 end

describe "CREATE #post" do
  it "redirects to categories index page upon save" do 
    post :create, category: FactoryGirl.attributes_for(:category)
    response.should redirect_to categories_path
  end
end

end