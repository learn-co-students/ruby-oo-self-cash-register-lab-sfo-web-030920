class CashRegister 
  
  attr_accessor :quantity, :price, :total, :discount, :items, :prev
  def initialize(discount=0)
    @total = 0
    @items = []
    @discount = discount
    @prev = 0
  end

  
  def add_item(twe, price, quantity= 1)
   counter = 0 
   @total += price * quantity
   while counter < quantity
   @items << twe
   counter += 1
   end
   @prev = price * quantity
  end 
  
  def apply_discount
    if @discount > 0 
    discounted = @total * @discount / 100
    @total = @total - discounted
    return "After the discount, the total comes to $#{@total}."
    else
    return "There is no discount to apply."
    end
  end 
  
  def void_last_transaction
    @total -= @prev
  end
end 