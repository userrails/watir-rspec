require 'rails_helper'

RSpec.describe Article, :type => :model do

  it "all fields are mandatory" do
    siv = Article.create!(name: 'siv rj', address: 'bangalore')
    prz = Article.create!(name: 'prz', address: 'bangalore')
  end
end