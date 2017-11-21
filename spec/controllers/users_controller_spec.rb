require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe 'viewing user profile' do
    it "should let a user see all the posts" do
      login_with create( :user )
      get :show
      expect( response ).to render_template( 'show' )
    end

  end  
  
end
