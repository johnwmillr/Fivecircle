class CouponsController < ApplicationController


  def show
    @coupon = Coupon.find(params[:id])  
  end


end