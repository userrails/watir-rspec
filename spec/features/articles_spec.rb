require "rails_helper"
require "rubygems"
require "watir-webdriver"
 
describe "localhost articles index" do
  let(:browser) { @browser ||= Watir::Browser.new :chrome } 
  let(:name) { SecureRandom.hex(6) }
  let(:address) {SecureRandom.hex(10)}
  before(:each) { browser.goto "http://localhost:3000" } 

  # after(:all) {browser.close}

  it "should click on new link and save the articles and checks if articles present" do
    browser.link(href: '/articles/new').click
    # expect(browser.url).to eq('http://localhost:3000/')

    browser.text_field(:id, "article_name").when_present.set(name)
    browser.textarea(:id, "article_address").when_present.set(address)   
    browser.button.click

    #to check if text exists in table or not after records save
    browser.td(:text => name).text.should_not be_nil    
    browser.td(:text => address).text.should_not be_nil

   # expect(browser.div(class: 'notice').text).to eq('Article was successfully created.')
  end

   it "should click on show link and view the article" do
     browser.link(href: "/articles/40").click
   end

   # it "should click on edit link and go to the articles edit page" do
   #   browser.link(href: "/articles/40/edit").click
   #   browser.button.click
   # end
  
end