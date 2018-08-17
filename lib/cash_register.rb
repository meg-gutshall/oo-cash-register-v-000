class CashRegister
  # Made accessors for methods used, not objects
  attr_accessor :total, :discount, :items, :last_transaction

  # Initialized cash register instance with a total of $0 and an optional
  # employee discount. Created an empty array of items for the cash
  # register instance.
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  # Add item takes arguments title (item name), price, and optional argument of
  # quantity. If no quantity is given, it defaults to 1. When item is added, the
  # cash register total is updated by adding the item price multiplied by the
  # quantity of the item. This method also tracks the last transaction made and
  # adds the title of the item into the @items array however many times needed
  # to match the quantity value.
  def add_item(title, price, quantity = 1)
    @total += price * quantity
    @last_transaction = price * quantity
    quantity.times {@items << title}
  end

  # Apply discount method takes the optional discount value and calculates the
  # appropriate discount on the item. Then it returns a statement either for a
  # discounted or non-discounted price.
  def apply_discount
    if discount != 0
      @total *= (100.0 - discount) / 100.0
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  # This method voids the previous transaction by using the @last_transaction
  # object tracked in the #add_item method.
  def void_last_transaction
    @total -= @last_transaction
  end

end
