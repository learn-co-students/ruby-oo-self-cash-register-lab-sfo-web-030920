require 'pry'
class CashRegister

    attr_accessor :discount, :total, :items, :last_trans
    def initialize(discount=0)
        @discount = discount
        @total = 0
        @items = []
        @last_trans = {}
    end

    def add_item(food, price, quantity=1)
        @total += price*quantity
        quantity.times do
            @items << food 
        end
        @last_trans = {num_items: quantity, price: price}
    end

    def apply_discount
        if  @discount > 0
            @total = @total - @total* @discount / 100
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    # 1000 => 800 (200)
    end
    
    def void_last_transaction()
        #PSEUDOCODE
       @total -= @last_trans[:price]*@last_trans[:num_items]
      @items = @items.slice(0,-1*@last_trans[:num_items])
        
    end

    
end