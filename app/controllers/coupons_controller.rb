class CouponsController < ApplicationController

def coupon_params
  params.require(:coupon).permit(:couponName, :description)
  # coupon_params[:merchant_id] = current_merchant.id    
end

def show
  @coupon = Coupon.find(params[:id])  
end

def new
  
end

def create
  uid = 1 # TODO: Fix this
  cp = coupon_params
  cp[:merchant_id] = uid
  @coupon = Coupon.create!(cp)
  flash[:notice] = "#{@coupon.couponName} was successfully created."
  redirect_to merchant_path(uid)
end

end