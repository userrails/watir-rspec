#this module is not working present and will implemented later
module ControllerMacros
  def login_user
    @user = FactoryGirl.create(:user, :email => "user1@gmail.com", :password => "123123123")
    sign_in @user
  end
end