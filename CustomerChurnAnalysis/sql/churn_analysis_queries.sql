-- Overall churn rate
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS churn_rate
FROM customers;

-- Churn by contract type
SELECT Contract,
       COUNT(*) AS total,
       SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned,
       ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS churn_rate
FROM customers
GROUP BY Contract
ORDER BY churn_rate DESC;

-- Churn by payment method
SELECT PaymentMethod,
       ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS churn_rate
FROM customers
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

-- Average monthly charges by churn
SELECT Churn,
       ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charge
FROM customers
GROUP BY Churn;

-- Tenure impact
SELECT Churn,
       ROUND(AVG(tenure),1) AS avg_tenure
FROM customers
GROUP BY Churn;