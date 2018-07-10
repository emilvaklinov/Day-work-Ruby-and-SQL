DROP TABLE pizza_orders;

CREATE TABLE pizza_orders(
  id SERIAL4 PRIMARY KEY,
	first_name VARCHAR(255),
	last_name  VARCHAR(255),
	flavour VARCHAR(255),
  amount INT2
);

INSERT INTO pizza_orders(first_name, last_name, flavour, amount)
  VALUES ('Keith', 'Douglas', 'pepperoni', '10');


  INSERT INTO pizza_orders(first_name, last_name, flavour, amount)
    VALUES ('Joanna', 'Gora', 'qoatro formadgy', '5');

  -- INSERT INTO pizza_orders(first_name, last_name, flavour, amount)
  --   VALUES ('Tahnee', 'Downie', 'vegeterian', '12');

SELECT * FROM pizza_orders;
