class MerchantsController < ApplicationController

  def index
    redirect_to root_path
  end

  def show
    if current_merchant
      @merchant = current_merchant
    else
      redirect_to root_path
    end
  end

end