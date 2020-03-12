class CashRegister
  
  attr_accessor :total, :discount
  
  def initialize(discount= 0)
    @total = 0
    @discount = discount
    @cart = []
    @items = []
  end
  
  def add_item(title, price, quantity= 1)
    self.total += quantity * price
      @items.unshift({title => [price, quantity]})
      quantity.times do 
          @cart << title
      end
  end

  def apply_discount  
    if @discount == 0
      return "There is no discount to apply."
    else
      self.total *= 1 - (@discount)/100.0
        "After the discount, the total comes to $#{@total.to_i}."
    end
  end
  
  def items
    @cart
  end
  
  def void_last_transaction
    void_item = @items.shift
    price, quantity = void_item.values[0]
    self.total -= price*quantity
  end
end