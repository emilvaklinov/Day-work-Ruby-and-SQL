require('pry-byebug')
require('pg')

class PizzaOrder
  attr_writer :flavour
  def initialize( options )
  @id = options['id'].to_i if options['id']
  @first_name = options ['first_name']
  @last_name = options ['last_name']
  @flavour = options ['flavour']
  @amount = options ['amount'].to_i
end
#in the hash everifing is in string because of gets.chop


def update()
# def delete()
  db = PG.connect( { dbname: 'pizza_shop', host: 'localhost' } )
  # sql = "DELETE FROM pizza_orders"
  # sql = "DELETE FROM pizza_orders WHERE id = $1"
  sql = "UPDATE pizza_orders SET (first_name, last_name, flavour, amount)= ($1, $2, $3, $4)
  WHERE id = $5"
  values = [ @id, @first_name, @last_name, @flavour, @amount ]
  # values = [ @id ]

  # sql = "SELECT * FROM pizza_orders"
  db.prepare( "update", sql)
  orders_array_of_hashes = db.exec_prepared("update")
  db.close()
  pizza_orders = orders_array_of_hashes.map {
    |hash_with_order_info| PizzaOrder.new (hash_with_order_info) }
  return pizza_orders
end


  # def initialize(first_name, last_name, flavour, amount)
  #   @first_name = first_name
  #   @last_name = last_name
  #   @flavour = flavour
  #   @amount = amount
  # end
  def PizzaOrder.delete_all()

  end

  def save
    # connect to DB
    db = PG.connect( { dbname: 'pizza_shop', host: 'localhost' } )

    # write our SQL
    # it will have actual values
        sql = "INSERT INTO pizza_orders (first_name,last_name,flavour,amount)
        VALUES ($1, $2, $3, $4) RETURNING *;" #returning array of hashes
        # ('#{@first_name}','#{@last_name}','#{@flavour}', #{@amount});"
        values = [@first_name, @last_name, @flavour, @amount]

    # execute that sql
    db.prepare("save", sql)
    hashes = db.exec_prepared("save", values)

    @id = hashes.first['id'].to_i #returning the id of hash from array of hashes!

    # disconnect from DB
    db.close()
  end


end
