use order_details;

SELECT *
FROM customer c
WHERE c.id IN (SELECT o.id FROM order_ o);

SELECT *
FROM order_ o
WHERE o.id IN (SELECT c.id FROM customer c);

SELECT *
FROM order_ o
WHERE o.id NOT IN (SELECT c.id FROM customer c);


SELECT *
FROM customer c
WHERE EXISTS (
  SELECT 1 FROM order_ o
  WHERE o.id = c.id
);

SELECT *
FROM customer c
WHERE NOT EXISTS (
  SELECT 1 FROM order_ o
  WHERE o.id = c.id
);

SELECT *
FROM order_ o
WHERE NOT EXISTS (
  SELECT 1 FROM customer c
  WHERE c.id = o.id
);



SELECT *
FROM customer
WHERE id = (
  SELECT o.id FROM order_ o
  WHERE o.o_name = 'Ball'
  LIMIT 1
);
