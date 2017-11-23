require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_user
  describe 'viewing user profile' do
    it "should have a current_user" do
      # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
      expect(subject.current_user).to_not eq(nil)
    end
  
    it "should get index" do
      # Note, rails 3.x scaffolding may add lines like get :index, {}, valid_session
      # the valid_session overrides the devise login. Remove the valid_session from your specs
      get :show,  {:id => subject.current_user}
      expect( response).to be_success
    end
    
    it "should let a user see all the posts" do
      get :show, {:id => subject.current_user}
      expect( response ).to render_template( 'show' )
    end

  end  
  
end
