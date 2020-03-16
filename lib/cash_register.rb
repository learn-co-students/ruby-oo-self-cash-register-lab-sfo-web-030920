require 'pry'
class CashRegister 
    attr_accessor :discount, :total
  
    def initialize(discount=0)
      @discount = discount 
      @total = 0
      @items = []
      @last_item = [] 
    end 
    
    def apply_discount
      if discount != 0 
        @total -= (@total * (@discount / 100.to_f))
        "After the discount, the total comes to $#{@total.to_i}."
      else 
        "There is no discount to apply."
      end 
    end 
    
    def add_item(title, price, quantity=1)
      @total += price * quantity 
      quantity.times do 
        @items << title 
      end 
      @last_item = price * quantity 
    end 
    
    def items 
      @items 
    end 
    
    def void_last_transaction 
       @items.delete_at(-1)
      self.total = self.total - @last_item
    end 
  end   
  # binding.pry