require('pry-byebug')
require_relative('model/pizza_order')

PizzaOrder.delete_all()

order1 = PizzaOrder.new(
  {'first_name' => 'Keith', 'last_name' => 'Douglas', 'flavour' => 'pepperoni', 'amount' => '10'}
)

order2 = PizzaOrder.new(
  {'first_name' => 'Joanna', 'last_name' => 'Gora', 'flavour' => 'qoatro formadgy', 'amount' => '5'}
)

order1.save()
order2.save()
# order1.delete()

order1.flavour = "mushroom"
order1.update()
# PizzaOrder.delete_all()
#
all_pizza_orders = PizzaOrder.all()

p all_pizza_orders

binding.pry
