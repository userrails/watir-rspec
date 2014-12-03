require "rails_helper"
require "rubygems"
require "watir-webdriver"
 
describe "in localhost" do
  let(:browser) { @browser ||= Watir::Browser.new :chrome } 
  before { browser.goto "http://localhost:3000" } 

  it "should click on new button to open the articles new form" do
    browser.link(href: '/articles/new').click
    browser.text_field(:id, "article_name").when_present.set("article1111")
    browser.textarea(:id, "article_address").when_present.set("address1")   
    browser.button.click
    browser.td(:text, /article1111/).text.should_not be_nil
  end
  
end