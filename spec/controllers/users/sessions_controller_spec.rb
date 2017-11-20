require 'spec_helper'
require 'rails_helper'
require 'devise'

describe Users::SessionsController do
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
      fake_results = [double('user1')]
      expect(User).to receive(:find_by_username).with('Qssss').
        and_return(fake_results)
      #@request.env["devise.mapping"] = Devise.mappings[:user]
      post :create, {:user => {:username =>'Qssss'}}
    end
  end
end