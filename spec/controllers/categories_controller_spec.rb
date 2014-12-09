require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do
 before(:each) do
  @category1 = FactoryGirl.create(:category, name: "category 2")
  @category2 = FactoryGirl.create(:category, name: "category 3")
 end

 describe "Testing GET #index" do
    # not required
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    # renders the :index view
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    # it loads @cat1, @cat2 in @categories that is populates an array of contacts
   it "should pass if loads all of the categories into @categories" do
    get :index
    expect(assigns(:categories)).to match_array([@category1, @category2])
   end
 end

describe "Testing GET #new" do
  it "should create a new category object on calling new action" do
    category = FactoryGirl.build(:category)
    Category.stub(:new).and_return(category)
    get :new
    assigns(:category).should == category
  end
end

describe "CREATE #post" do
    context "with valid attributes" do
      # process 1: attributes_for generate hash of values for the ruby object category:
      it "redirects to categories index page upon save" do 
        post :create, category: FactoryGirl.attributes_for(:category)
        response.should redirect_to categories_path
      end
      # process 2:
      it "creates a new categories" do
        expect {
          post :create, category: FactoryGirl.attributes_for(:category)
        }.to change(Category, :count).by(1)        
      end
    end 

    context "with invalid attributes" do 
      #eg shows record should not be saved if invalid attributes
      it "doesnot save the new category" do 
        expect{
          post :create, category: FactoryGirl.attributes_for(:invalid_category)
        }.to_not change(Category, :count)
      end

      #when records not saved it should render the new action or page
      it "re-renders the new method" do
        post :create, category: FactoryGirl.attributes_for(:invalid_category)
        response.should render_template :new
      end
    end
  end

  describe "edit #get" do
    #pass edit action
    it "should pass if category edit action pass" do
      get :edit, {:id => @category1.id}
    end
  end

  describe "update #put" do
    context "valid attributes" do
      it "located the requested @category" do
        put :update, id: @category1, category: FactoryGirl.attributes_for(:category)
        assigns(:category).should eq(@category1)
      end

      #this update the records with new params and expect values updated using expect() or eq()
      it "changes @categorie's attributes" do
        put :update, id: @category1, category: FactoryGirl.attributes_for(:category, name: "update category5")
        @category1.reload
        @category1.name.should eq("update category5")
      end

      #after successfully updation redirect to updated categories or category show action
      it "redirects to the updated categories" do 
        put :update, id: @category1, category: FactoryGirl.attributes_for(:category)
        response.should redirect_to @contact
      end
    end

    context "invalid attributes" do
      it "locates the requested @category" do
        put :update, :id => @category1, category: FactoryGirl.attributes_for(:invalid_category)
        assigns(:category).should eq(@category1)
      end

      it "doesnot change @category1's attributes" do
        put :update, id: @category1, category: FactoryGirl.attributes_for(:category, name: "category7")
        @category1.reload
        @category2.name.should_not eq("category7")
      end

      it "render the edit method when values do not update successfully" do
        put :update, id: @category1, category: FactoryGirl.attributes_for(:invalid_category)
        response.should render_template :edit
      end
    end
  end


end