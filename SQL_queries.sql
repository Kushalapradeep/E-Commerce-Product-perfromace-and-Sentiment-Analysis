📁 SQL Analysis for Blinkit E-commerce Business Problems

-- ✅ 1. Overall Business Performance (Revenue, Orders, Customers, ROAS)

SELECT 
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue,
    ROUND(SUM(mp.revenue_generated) / NULLIF(SUM(mp.spend), 0), 2) AS overall_roas
FROM blinkit_orders o
JOIN blinkit_customers c ON o.customer_id = c.customer_id
JOIN blinkit_order_items oi ON o.order_id = oi.order_id
JOIN blinkit_marketing_performance mp ON 1 = 1; -- assuming ROAS is aggregated separately

✅ 2. Orders and Revenue by Area
SELECT 
    c.area,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM blinkit_orders o
JOIN blinkit_customers c ON o.customer_id = c.customer_id
JOIN blinkit_order_items oi ON o.order_id = oi.order_id
GROUP BY c.area
ORDER BY total_revenue DESC;

✅ 3. Top and Bottom Products by Revenue and Orders

SELECT 
    p.product_id,
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS revenue,
    COUNT(DISTINCT oi.order_id) AS order_count
FROM blinkit_order_items oi
JOIN blinkit_products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC -- Use ASC for bottom products
LIMIT 5;

✅ 4. Slow-Moving or Unsold Products with Inventory

SELECT 
    p.product_id,
    p.product_name,
    SUM(i.stock_received) AS stock_received,
    SUM(i.damaged_stock) AS damaged_stock,
    COUNT(DISTINCT oi.order_id) AS order_count
FROM blinkit_products p
LEFT JOIN blinkit_order_items oi ON p.product_id = oi.product_id
LEFT JOIN blinkit_inventory i ON p.product_id = i.product_id
GROUP BY p.product_id, p.product_name
HAVING order_count < 10 OR order_count IS NULL;

✅ 5. Inventory Value and Damage %

SELECT 
    p.product_id,
    p.product_name,
    SUM(i.stock_received * oi.unit_price) AS inventory_value,
    SUM(i.damaged_stock) AS total_damaged,
    ROUND(100.0 * SUM(i.damaged_stock) / NULLIF(SUM(i.stock_received), 0), 2) AS damage_percentage
FROM blinkit_inventory i
JOIN blinkit_products p ON i.product_id = p.product_id
JOIN blinkit_order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY damage_percentage DESC;

✅ 6. Top Customers 

SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_spent,
    ROUND(AVG(oi.quantity * oi.unit_price), 2) AS avg_order_value
FROM blinkit_customers c
JOIN blinkit_orders o ON c.customer_id = o.customer_id
JOIN blinkit_order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 10;

✅ 7. ROAS by Marketing Channel

SELECT 
    channel,
    SUM(spend) AS total_spend,
    SUM(revenue_generated) AS total_revenue,
    ROUND(SUM(revenue_generated) / NULLIF(SUM(spend), 0), 2) AS roas
FROM blinkit_marketing_performance
GROUP BY channel
ORDER BY roas DESC;

✅ 8. Sentiment Score Distribution

SELECT 
    CASE 
        WHEN sentiment_score >= 0.05 THEN 'Positive'
        WHEN sentiment_score <= -0.05 THEN 'Negative'
        ELSE 'Neutral'
    END AS sentiment_category,
    COUNT(*) AS feedback_count
FROM blinkit_customer_feedback
GROUP BY sentiment_category;

✅ 9. Sentiment vs Product Revenue (via order_id bridge)

SELECT 
    oi.product_id,
    p.product_name,
    ROUND(AVG(cf.sentiment_score), 2) AS avg_sentiment,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM blinkit_customer_feedback cf
JOIN blinkit_order_items oi ON cf.order_id = oi.order_id
JOIN blinkit_products p ON oi.product_id = p.product_id
GROUP BY oi.product_id, p.product_name
ORDER BY total_sales DESC;

✅ 10. Delivery Delays and Average Time by Area

SELECT 
    C. area,
    COUNT(*) AS total_deliveries,
    ROUND(AVG(Df. delivery_time), 2) AS avg_delivery_time,
    ROUND(100.0 * SUM(CASE WHEN Df. delivery_time <= 5 THEN 1 ELSE 0 END) / COUNT(*), 2) AS on_time_percentage
FROM blinkit_delivery_performance 
JOIN Customers C
GROUP BY area
ORDER BY avg_delivery_time DESC;




