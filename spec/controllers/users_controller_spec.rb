require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'viewing user profile' do
    it 'should call the model method that displays the user profile' do
      get :show, id: 1
    end
  end  
end
