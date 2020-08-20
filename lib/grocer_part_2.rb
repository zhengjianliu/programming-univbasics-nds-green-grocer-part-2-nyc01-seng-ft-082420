require_relative './part_1_solution.rb'
require 'pry'
def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |key|
    coupons.each do |coupon_key|
      if key[:item] == coupon_key[:item] && key[:count] >= coupon_key[:num] && key[:count] != 0
        cart.push({:item => key[:item]+" W/COUPON", :price => coupon_key[:cost] / coupon_key[:num], :clearance => key[:clearance], :count => key[:count] / coupon_key[:num] * coupon_key[:num]})
        key[:count] = key[:count] - key[:count] / coupon_key[:num] * coupon_key[:num]
        #binding.pry
      end
    end
  end
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |key|
    if key[:clearance]
      key[:price] *= 0.8
    end
  end
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  counter = 0 
  while counter < cart.length
    if cart[counter][:clearance]
      cart[counter][:price] = (cart[counter][:price] - (cart[counter][:price] * 0.20)).round(2)
    end 
    counter += 1 
  end
  cart
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  couponed_cart = apply_coupons(consolidated_cart, coupons)
  final_cart= apply_clearance(couponed_cart)
  
  total = 0 
  counter = 0 
  while counter < final_cart.length
     total += final_cart[counter][:price] * final_cart[counter][:count]
  
     counter += 1 
  end
  if total > 100
    total -= (total * 0.10) 
  end
  total
  
end
