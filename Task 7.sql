

CREATE OR REPLACE VIEW v_customer_orders AS
SELECT
  c.id AS customer_id,
  c.name AS customer_name,
  o.o_name AS order_name,
CASE WHEN o.id IS NULL THEN 'No' ELSE 'Yes' END AS has_order
FROM customer c
LEFT JOIN order_ o
ON o.id = c.id;

CREATE OR REPLACE VIEW v_customer_order_full AS
SELECT c.id, c.name, o.o_name, 'LHS' AS src
FROM customer c
LEFT JOIN order_ o ON o.id = c.id
UNION
SELECT c.id, c.name, o.o_name, 'RHS' AS src
FROM customer c
RIGHT JOIN order_ o ON o.id = c.id;


CREATE OR REPLACE VIEW v_customer_public
AS
SELECT id, name
FROM customer;
