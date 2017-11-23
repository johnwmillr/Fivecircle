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
          @request.env['devise.mapping'] = Devise.mappings[:user]
          get :new
          expect( response ).to render_template( 'new' )
        end
    end


  describe 'create' do
    it 'should create a user session if the password is correct and the user exist' do
      fake_userparam = {:username => "person3", :password =>"12345678"}
      fake_user = double({:username => "person3"})
      @request.env['devise.mapping'] = Devise.mappings[:user]
      expect(User).to receive(:create).with(fake_userparam).and_return(fake_user)
      post :create, {:user => fake_userparam}
    end
    it 'should generate flash' do
      fake_userparam = {:username => "person3", :password =>"12345678"}
      fake_user = double({:username => "person3"})
      allow(User).to receive(:create).and_return(fake_user)
      @request.env['devise.mapping'] = Devise.mappings[:user]
      post :create, {:user => fake_userparam}
      expect(subject.current_user).not_to eq(nil)
    end
    it'should redirect to login path'   do 
      fake_userparam = {:username => "person3", :password =>"12345678"}
      fake_user = double({:username => "person3"})
      allow(User).to receive(:create).and_return(fake_user)
      @request.env['devise.mapping'] = Devise.mappings[:user]
      expect(post :create, {:user => fake_userparam}).to render_template('new')
    end
  end
  describe 'searching by uer id' do
    login_user
   it 'should call the user method that performs find by user id search' do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      
      fake_results = double('user1')
      expect(User).to receive(:find_by_username).with('person1').and_return(true)
      #@request.env["devise.mapping"] = Devise.mappings[:user]
      post :create, {:user => {:username =>'person1', :password => '12345678'}}
    end
  end
end