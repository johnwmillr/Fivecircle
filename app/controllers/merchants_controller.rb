class MerchantsController < ApplicationController

  def index
    redirect_to root_path
  end

  def show
      # if current_user
      #     @user = current_user
      # else
      #     redirect_to root_path
      # end
    # @merchants = Merchant.all
    # @merchant  = Merchant.find(params[:id])
    puts "*******************************************"
    puts "params: " + params.inspect
  end
end