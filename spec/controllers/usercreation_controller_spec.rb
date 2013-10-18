require 'spec_helper'

describe ProductsController do

  include Devise::TestHelpers

  it 'should create a new user' do

    @user = FactoryGirl.create(:user)
    User.all.count.should == 1

  end

end
