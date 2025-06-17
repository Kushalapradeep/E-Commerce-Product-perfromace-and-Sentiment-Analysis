📊  E-Commerce-Product-perfromace-and-Sentiment-Analysis
🚚 Product Performance | 💬 Customer Sentiment | 📦 Inventory | 📣 Marketing | 👥 Customers
Tools used:  Excel, Julus.ai, SQL and Power BI.

🔍 Project Overview

This project analyzes Blinkit's multi-table e-commerce data to uncover actionable insights across sales, inventory, sentiment, delivery, customers, and marketing. The complete analytics process includes:

Excel for data cleaning and transformation

SQL for structured business analysis

Power BI for interactive dashboard building

Julius AI to generate sentiment scores from textual feedback

🔎 Business Problems & Insights

This 4-page Power BI dashboard addresses 10 key business questions. Below are the problems, how they were solved, and insights generated:

✅ 1. What is the overall business performance (revenue, orders, customers, ROAS)?

Solved Using: SQL aggregation + Power BI KPIs

Insight: Total revenue = ₹4.97M, 5,000 orders, 2,500 customers, ROAS ~14.8

✅ 2. Which areas contribute the most to revenue and orders?

Solved Using: SQL area-wise grouping + map/bar chart

Insight: Metro areas and Tier-1 cities generate the most revenue

✅ 3. Which products generate the highest/lowest revenue and order volume?

Solved Using: SQL with SUM + COUNT + Power BI bar charts

Insight: Vitamins, Pet Treats, and Cough Syrup are top performers; low performers identified for improvement

✅ 4. Which products are slow-moving or unsold but still in inventory?

Solved Using: Excel filtering + SQL LEFT JOIN + Power BI tables

Insight: Several items with zero orders but existing stock flagged for clearance or promotion

✅ 5. How much inventory is damaged and what's the net inventory value?

Solved Using: SQL damage % + Excel cleaning + DAX for inventory value

Insight: Over 50% damage in some categories; detergent and dairy categories heavily impacted

✅ 6. Who are the top customers and how can they be segmented?

Solved Using: SQL spend ranking + Power BI segmentation visuals

Insight: Created 4 segments: Premium Patrons, Smart Spenders, Budget Buyers, Elite Users

✅ 7. Which marketing channels give the best ROAS?

Solved Using: SQL ROAS = revenue/spend + Power BI bar chart

Insight: App and Email channels deliver the highest ROAS (~3.7x)

✅ 8. What is the sentiment trend across customer feedback?

Solved Using: Julius AI for sentiment scoring + Power BI sentiment donut

Insight: 49% positive, 27% negative, 24% neutral feedback

✅ 9. How does sentiment impact product performance?

Solved Using: SQL sentiment vs revenue join via order_id + scatter plot

Insight: Bread and cereal had high revenue but poor sentiment, indicating risk of churn

✅ 10. How efficient is the delivery process by area?

Solved Using: SQL delay %, avg time + Power BI visual

Insight: 18% of deliveries are severely delayed; targeted regions identified for logistics optimization


🔧 Excel Transformations

Removed duplicates, handled missing values

Merged and cleaned inventory, orders, feedback for proper joins

Pre-aggregated summaries before SQL modeling when needed

🔠 SQL Analysis

Joined 8 tables using keys (order_id, product_id, customer_id)

Performed aggregation, grouping, ranking, filtering

Created intermediate tables for sales vs sentiment

🎨 Power BI Dashboard

Executive Summary (KPIs & performance at a glance)

Product & Inventory (Top/Bottom products, damage %, inventory value)

Customer & Marketing (Segments, top customers, channel ROAS)

Sentiment & Delivery (Sentiment vs sales, delay analysis, feedback)


📄 Files in This Repository
- Blinkit Dataset( 8 files)
- Transformed Excel file
- Blinkit_sql queries.sql
- Blinkit_dashboard-Pdf
  

📌  Key Insights with Recommendations

Business Performance
→ Total revenue stands at ₹4.97M from 5,000 orders and 2,500 customers, with a strong ROAS of ~14.8.
✅ Continue investing in high-yield channels and optimize order handling to support growth.

Top Revenue-Contributing Areas
→ Metro and Tier-1 cities drive the bulk of orders and revenue.
✅ Focus marketing and logistics efforts on these high-performing regions.

Product Performance (Top & Bottom)
→ Vitamins, Pet Treats, and Cough Syrup top the list; several low-performing SKUs identified.
✅ Reallocate marketing spend toward high performers; reevaluate or discontinue underperformers.

Slow-Moving Inventory
→ Multiple products exist in inventory without any orders.
✅ Flag for discounting, bundling, or removal to avoid dead stock cost.

Inventory Damage
→ Over 50% damage rate in categories like detergents and dairy.
✅ Investigate supply chain/handling issues and review supplier/warehouse practices.

Customer Segmentation
→ Customers classified into 4 segments based on spend and order patterns and also on average average value.
✅ Personalize marketing and offers per segment to boost engagement and retention.

Marketing Channel ROAS
→ App and Email yield the best ROAS (~3.7x), outperforming other channels.
✅ Prioritize high-performing channels for future campaigns and reduce SMS/social spend.

Sentiment Breakdown
→ Sentiment score distribution: 49% Positive, 24% Neutral, 27% Negative.
✅ Set up alerts for spikes in negative sentiment and flag affected orders or categories.

Sales vs Sentiment (Product Risk)
→ Bread and cereal generate high revenue but poor sentiment.
✅ Urgently review quality, packaging, or delivery issues to protect brand reputation.

Delivery Delays
→ 18% of orders suffer severe delays; specific areas identified.
✅ Reroute or optimize last-mile delivery in delay-prone regions.

🌟 Outcome

Enabled strategic insights across operations, marketing, customer service, and inventory — helping Blinkit identify risks, growth opportunities, and performance gaps using real-world analytical workflows.

