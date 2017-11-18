class CouponsController < ApplicationController

def coupon_params
  params.require(:coupon).permit(:couponName, :description)
end

def show
  c = Coupon.where(:id=>params[:id],:merchant_id=>current_merchant[:id])
  if c.length == 1
    @coupon = c[0]
  else
    redirect_to merchant_path(current_merchant[:id])
  end  
end

def new
  
end

def create
  cp = coupon_params
  cp[:merchant_id] = current_merchant[:id]
  @coupon = Coupon.create!(cp)
  flash[:notice] = "#{@coupon.couponName} was successfully created."
  redirect_to merchant_path(current_merchant[:id])
end

end