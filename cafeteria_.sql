use  cafeteria;
show tables;
select * from orders;
select * from product;
CREATE VIEW last_user_order AS
SELECT 
    u.id AS user_id,  
    u.name AS user_name,  
    o.id AS order_id,  
    o.order_date AS last_order_date  
FROM 
    user u
JOIN 
    orders o ON u.id = o.user_id
WHERE 
    o.order_date = (
        SELECT MAX(order_date)
        FROM orders
        WHERE user_id = u.id
    );

select u.name ,o.name from user u join orders o on u.id=o.user_id group by name;

create view each_user_ordres_DATE AS 
SELECT 
    u.name AS name,  order_date,
    GROUP_CONCAT(o.id ORDER BY o.order_date DESC) AS orders
FROM 
    user u
JOIN 
    orders o ON u.id = o.user_id
GROUP BY 
    u.name;

