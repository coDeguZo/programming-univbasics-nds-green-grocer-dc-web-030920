def find_item_by_name_in_collection(name, collection)
  index = 0
  while index < collection.count do
    item_to_find = collection[index]
    if (item_to_find[:item] == name)
      return item_to_find
    end
    index += 1
  end
  nil
end

def increments_cart_item(cart, item_name)
  cart_index = 0
  while cart_index < cart.count do
    item_cart = cart[cart_index]
    if item_cart[:item] == item_name
      item_cart[:count] += 1
    end
    cart_index += 1
  end
  cart
end

def consolidate_cart(cart)
  new_cart = Array.new
  cart_index = 0
  while cart_index < cart.count do
    current_item = cart[cart_index]
    item_to_find = find_item_by_name_in_collection(current_item[:item], new_cart)
    if item_to_find == nil
      current_item[:count] = 1
      new_cart << current_item
    else
      increments_cart_item(new_cart, current_item[:item])
    end
    cart_index += 1
  end
  new_cart
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  coupons_index = 0
  while coupons_index < coupons.count do
    current_coupon = coupons[coupons_index]
    discounted_items = find_item_by_name_in_collection(current_coupon[:item], cart)
    if discounted_items[:count] / current_coupon[:num] >= 1
      cart << {
        :item => "#{current_coupon[:item]} W/COUPON",
        :price => current_coupon[:cost] / current_coupon[:num].round(2),
        :clearance => discounted_items[:clearance],
        :count => discounted_items[:count] - (discounted_items[:count] % current_coupon[:num])
      }
      discounted_items[:count] %= current_coupon[:num]
    end
    coupons_index += 1
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  checkout_cart = Array.new
  cart_index = 0
  while cart_index < cart.count do
    current_item = cart[cart_index]
    if current_item[:clearance]
      c_price = c_price[:price] - (c_price[:price] * .20)
    end
    cart_index += 1
    checkout_cart << c_price
  end
  checkout_cart
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
end