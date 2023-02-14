Unlike in JavaScript, the == method in Ruby will not coerce strings to numbers before comparing them, or perform some of the other type coercions that JavaScript does. For example, in JavaScript, using the == operator can lead to some strange behavior:

"1" == 1
// => true
0 == []
// => true
[] == ![]
// => true 🤔
In Ruby, the == method checks if the objects on both sides are considered the equivalent values:

"1" == 1
# => false
1 == 1
# => true

In Ruby, this example returns true because Ruby considers these to have equivalent values:

[1, 2, 3] == [1, 2, 3]
# => true
Ruby will also check if an Integer has the equivalent value to a Float, even though they're technically different data types:

1.0 == 1
# => true
The reason for this is because in Ruby, the == operator is actually a method that has unique behavior that depends on which class the method is defined in! The code above is equivalent to the following method call:

Let's take the example of an online shopping web application. Such an application has a number of jobs to handle: we need to have users that sign in and purchase items; we have the items themselves that we are selling; we likely have a shopping cart as well. We could develop an application that takes care of all of these jobs in the following manner:

class MyStore

  def sign_in(user)
    @user = user
  end

  def current_user
    @user
  end

  def item(item)
    @item = item
  end

  def item_price=(price)
    @item_price = price
  end

  def shopping_cart
    @shopping_cart = []
  end

  def add_item_to_cart(item)
    @shopping_cart << item
  end

  ...

end



#Lately, our client has been offering a variety of discounts. At the time of checkout, a user can tell our application that they have a 10, 25, or 50 percent discount. So, our program needs to determine if a user has a discount and then apply it, if present. Let's take a look at the #checkout method of our ShoppingCart class.

def checkout(discount=0)
  total = 0
  #the shopping_cart method holds an array of all the user's items
  shopping_cart.each do |item|
    total += item.price
  end

  if discount == 10
    total = total - total * 10 / 100.00
  elsif discount == 20
    total = total - total * 20 / 100.00
  elsif discount == 50
    total = total - total * 50 / 100.00
  end

  total

end

# Let's refactor the code above to include coupons and an attribute accessor
class ShoppingCart
    attr_accessor :coupon
  
    def checkout
      total = 0
      #the shopping_cart method holds an array of all the user's items
      shopping_cart.each do |item|
        total += item.price
      end
  
      if coupon
        total = total - total * coupon / 100.00
      end
  
      total
  
    end
  end

  #Our new #coupon method is what is referred to as a helper method. It functions to assist our #checkout method and is called inside the checkout method.

  #Another OO principle states that methods should not exceed 5 lines of code and classes should not exceed 100.

  #More refactoring on the checkout method
  def checkout
    total = shopping_cart.sum { |item| item.price }
  
    ...
  end

  #A domain model is a representation of real-world concepts in software. 