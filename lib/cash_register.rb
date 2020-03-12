
require 'pry'
class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = {}
    end

    def add_item(item, price, quantity = 1) #why does this have to be 1?
        quantity.times do 
            @items << item
        end
        @last_transaction[:price] = price  # setting the last transaction
        @last_transaction[:quantity] = quantity
        @total += (price * quantity)
    end

    def apply_discount
        if @discount == 0
           return "There is no discount to apply."
        end
        @total = self.total - (self.discount * 10)
        #@total = @total - (@discount * 10)
        # binding.pry
        #     puts '.'
         "After the discount, the total comes to $#{@total}."
            
    end

    def void_last_transaction
        #@items.pop 
        #store last transaction - stores item quantity in a hash x
        #pop off n elements from @items array, n = quantity x
        # subtract (n * price) from @total
        @items.pop(last_transaction[:quantity])
        @total -= (last_transaction[:quantity] * last_transaction[:price])
    end

end

# new_cart = CashRegister.new(20)
# new_cart.add_item("tomato", 2, 3)
# binding.pry
# puts 's'