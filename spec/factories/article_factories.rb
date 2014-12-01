FactoryGirl.define do
  # factory :article do |f|
  #   f.id 1
  #   f.name "ruby material"
  #   f.address "Bommanhalli"
  #   f.created_at Time.now
  #   f.updated_at Time.now
  # end


  factory :article do
    name "article name"
    address "article address"
  end
end