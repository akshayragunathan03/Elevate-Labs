use order_details;

DELIMITER //

CREATE  FUNCTION fn_customer_order_count(p_customer_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
  DECLARE v_cnt INT;
  SELECT COUNT(*) INTO v_cnt
  FROM `order_` o
  WHERE o.id = p_customer_id;
  RETURN v_cnt;
END//

DELIMITER ;
SELECT id, name, fn_customer_order_count(id) AS order_count
FROM customer;

SELECT name
FROM customer
WHERE fn_customer_order_count(id) > 0;


DELIMITER //

CREATE PROCEDURE sp_add_customer_and_optional_order(
  IN  p_customer_name VARCHAR(50),
  IN  p_order_name    VARCHAR(50)
)
BEGIN
  DECLARE v_new_customer_id INT;

  IF p_customer_name IS NULL OR LENGTH(TRIM(p_customer_name)) = 0 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Customer name is required';
  END IF;

  START TRANSACTION;

  INSERT INTO customer(name) VALUES (p_customer_name);
  SET v_new_customer_id = LAST_INSERT_ID();

  IF p_order_name IS NOT NULL AND LENGTH(TRIM(p_order_name)) > 0 THEN
    INSERT INTO `order_`(id, o_name)
    VALUES (v_new_customer_id, p_order_name);
  END IF;

  COMMIT;

  SELECT v_new_customer_id AS new_customer_id,
         p_customer_name   AS customer_name,
         p_order_name      AS created_order_if_any;
END;

select * from customer;



DELIMITER //

CREATE PROCEDURE sp_customer_summary(
  IN  p_customer_id INT,
  OUT p_has_orders  TINYINT
)
BEGIN

  IF NOT EXISTS (SELECT 1 FROM customer WHERE id = p_customer_id) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Customer does not exist';
  END IF;

  SET p_has_orders = EXISTS (SELECT 1 FROM `order_` WHERE id = p_customer_id);

  SELECT
    c.id,
    c.name,
    fn_customer_order_count(c.id) AS order_count
  FROM customer c
  WHERE c.id = p_customer_id;
END//
DELIMITER ;

SET @has := 0;
CALL sp_customer_summary(101, @has);
SELECT @has AS has_orders;  -- 0 or 1
