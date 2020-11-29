class CashRegister
    attr_accessor :total, :discount, :transaction, :items
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @transaction = []
    end

    def total
        return @total
    end

    def add_item(item, price, quantity=1)
        self.total += (price * quantity)
        quantity.times do
            self.items.push(item)
        end
        self.transaction.push(price * quantity)
    end

    def apply_discount
        if self.discount > 0
            self.total = self.total - (self.total * (self.discount / 100.0))
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end
    
    def void_last_transaction
        last_transaction = self.transaction.pop
        self.total -= last_transaction
    end
end
