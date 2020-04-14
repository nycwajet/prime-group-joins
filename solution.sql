-- Get all customers and their addresses.

SELECT * FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id;

-- Get all orders and their line items (orders, quantity and product).

SELECT "orders".id, "line_items".quantity, "line_items".product_id, "products".description FROM "orders"
JOIN "line_items" ON "orders".id = "line_items".order_id
JOIN "products" ON "line_items".product_id = "products".id ;

-- Which warehouses have cheetos?

SELECT "warehouse".warehouse FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
WHERE "warehouse_product".product_id = 5;

-- Which warehouses have diet pepsi?

SELECT "warehouse".warehouse FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
WHERE "warehouse_product".product_id = 6;

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT count("orders".id), "customers".first_name, "customers".last_name FROM "orders"
JOIN "addresses" ON "addresses".id = "orders".address_id
JOIN "customers" ON "customers".id = "addresses".customer_id
GROUP BY "customers".first_name, "customers".last_name;


-- How many customers do we have?

SELECT count("customers".id) FROM "customers";


-- How many products do we carry?

SELECT count("products".id) FROM "products";

-- What is the total available on-hand quantity of diet pepsi?

SELECT SUM("warehouse_product".on_hand) FROM "warehouse_product";