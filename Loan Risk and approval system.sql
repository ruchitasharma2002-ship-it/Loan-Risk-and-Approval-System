USE Finance_loanDB;

SELECT * FROM dbo.Finance_Loan_Dataset;

SELECT COUNT(*) AS total_rows
FROM dbo.Finance_Loan_Dataset;

SELECT TOP 5*
FROM dbo.Finance_Loan_Dataset;

SELECT COUNT(*)
FROM dbo.Finance_Loan_Dataset
WHERE loan_limit IS NULL; 

SELECT loan_limit, COUNT(*)
FROM dbo.Finance_Loan_Dataset
GROUP BY loan_limit;


SELECT
   SUM(CASE WHEN loan_limit IS NULL THEN 1 ELSE 0 END) AS loan_limit_nulls,
   SUM(CASE WHEN loan_type IS NULL THEN 1 ELSE 0 END) AS loan_type_nulls,
   SUM(CASE WHEN income IS NULL THEN 1 ELSE 0 END) AS income_nulls,
   SUM(CASE WHEN Credit_Worthiness IS NULL THEN 1 ELSE 0 END) AS credit_nulls,
   SUM(CASE WHEN property_value IS NULL THEN 1 ELSE 0 END) AS property_value_nulls
FROM dbo.Finance_Loan_Dataset;

SELECT * FROM dbo.Finance_Loan_Dataset;

SELECT DISTINCT status
FROM dbo.Finance_Loan_Dataset;

SELECT DISTINCT loan_type 
FROM DBO.Finance_Loan_Dataset;

SELECT DISTINCT loan_limit
FROM dbo.Finance_Loan_Dataset;

SELECT DISTINCT occupancy_type
FROM dbO.Finance_Loan_Dataset;

SELECT
  status,
  COUNT(*) AS duplicate_count
FROM dbo.Finance_Loan_Dataset
GROUP BY status
HAVING COUNT(*) > 1;

SELECT * FROM dbo.Finance_Loan_Dataset;

SELECT
   dtir1,
   credit_type,
   CASE 
     WHEN dtir1 > 50 OR credit_type = 'Poor' THEN 'High'
     WHEN dtir1 BETWEEN 35 AND 50 THEN 'Medium'
     WHEN dtir1 < 35 THEN 'Low'
     ELSE 'Unknown'
    END AS Risk_Category
FROM dbo.Finance_Loan_Dataset;


SELECT
  LTV,
  CASE
   WHEN LTV < 60 THEN 'Low'
   WHEN LTV BETWEEN 60 AND 80 THEN 'Medium'
   ELSE 'High'
 END AS loan_to_value_bucket
FROM dbo.Finance_Loan_Dataset;

SELECT
  income,
  CASE
   WHEN income < 50000 THEN 'Low Income'
   WHEN income BETWEEN 50000 AND 100000 THEN 'Medium Income'
   ELSE 'High Income'
 END AS income_Group
FROM dbo.Finance_Loan_Dataset;
 

SELECT
  Region,
  status,
  COUNT(*) AS total_applications
FROM dbo.Finance_Loan_Dataset
GROUP BY Region,status;

SELECT
  credit_type,
  status,
  COUNT(*) AS total_applications
FROM dbo.Finance_Loan_Dataset
GROUP BY credit_type,status;

SELECT
  loan_type,
  status,
  COUNT(*) AS total_applications
FROM dbo.Finance_Loan_Dataset
GROUP BY loan_type,status;

SELECT 
  CASE
    WHEN income < 50000 THEN 'Low Income'
    WHEN income BETWEEN 50000 AND 100000 THEN 'Medium Income'
    ELSE 'High Income'
  END AS Income_Group,
  AVG(loan_amount) AS avg_loan_amount

FROM dbo.Finance_Loan_Dataset

GROUP BY
  CASE 
   WHEN income < 50000 THEN 'Low Income'
   WHEN income BETWEEN 50000 AND 100000 THEN 'Medium Income'
   ELSE 'High Income'
 End;

 SELECT 
   loan_type,
   AVG(rate_of_interest) AS avg_interest_rate
FROM dbo.Finance_Loan_Dataset
GROUP BY loan_type;

SELECT
  SUM(loan_amount) AS total_loan_disbursed
FROM dbo.Finance_Loan_Dataset;



SELECT *
FROM dbo.Finance_Loan_Dataset
WHERE dtir1 > 50
AND income < 50000;

SELECT
   Region,
   COUNT(*) AS declined_loans
FROM dbo.Finance_Loan_Dataset
WHERE status='Declined'
GROUP BY Region
ORDER BY declined_loans DESC;

SELECT
  LTV,
  COUNT(*) AS total
FROM dbo.Finance_Loan_Dataset
GROUP BY LTV, status
ORDER BY LTV;


SELECT*
FROM dbo.Finance_Loan_Dataset
WHERE income > 100000
AND loan_amount < 200000;


SELECT*
FROM dbo.Finance_Loan_Dataset
WHERE income < 50000
AND loan_amount > 500000;

SELECT TOP 5 * FROM dbo.Finance_Loan_Dataset;