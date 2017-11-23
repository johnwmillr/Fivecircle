require 'spec_helper'
require 'rails_helper'
require 'devise'

describe Users::SessionsController, :type => :controller do
    
    describe "anonymous user" do
        before :each do
          # This simulates an anonymous user
          login_with nil
        end
    
        it "should be redirected to signin" do
          get :index
          expect( response ).to redirect_to( new_user_session_path )
        end
    end
    it "should let a user see all the posts" do
      login_with create( :user )
      get :show
      expect( response ).to render_template( :index )
    end

  describe 'create' do
    it 'should create a user session if the password is correct and the user exist' do
      fake_movieparam = {:title => "aa", :release_date =>" ", :description =>" ", :rating => " "}
      fake_movie = double({:title => "aa"})
      expect(Movie).to receive(:create!).and_return(fake_movie)
      post :create, {:movie => fake_movieparam}
    end
    it 'should generate flash' do
      fake_movieparam = {:title => "aa", :release_date =>" ", :description =>" ", :rating => " "}
      fake_movie = double({:title => "aa"})
      allow(Movie).to receive(:create!).and_return(fake_movie)
      post :create, {:movie => fake_movieparam}
      expect(flash[:notice]).to eq("aa was successfully created.")
    end
    it'should redirect to movie index'   do 
      fake_movieparam = {:title => "aa", :release_date =>" ", :description =>" ", :rating => " "}
      fake_movie = double({:title => "aa"})
      allow(Movie).to receive(:create!).and_return(fake_movie)
      expect(post :create, {:movie => fake_movieparam}).to redirect_to movies_path
    end
  end
  describe 'searching by uer id' do
   it 'should call the user method that performs find by user id search' do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in users(:alice)
      expect(User).to receive(:find_by_username).with('alice').
        and_return(fake_results)
      #@request.env["devise.mapping"] = Devise.mappings[:user]
      post :create, {:user => {:username =>'alice'}}
    end
  end
end