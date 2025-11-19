SELECT * FROM bank_loan.`debit credit cleaned data`;

-- Total Credit Amount
select format(round(SUM(Amount),0),"M") AS Total_Credit_Amount from `debit credit cleaned data` where `Transaction Type` = 'Credit';


-- Total Debit Amount
select format(round(SUM(Amount),0),"M") AS Total_Credit_Amount from `debit credit cleaned data` where `Transaction Type` = 'Debit';


-- Credit to debit ratio
select 
    (SUM(CASE WHEN `Transaction Type` = 'Credit' THEN Amount ELSE 0 END) /
     SUM(CASE WHEN `Transaction Type` = 'Debit' THEN Amount ELSE 0 END)) 
     AS Credit_to_Debit_Ratio
FROM `debit credit cleaned data`;


-- Net Transaction Amount
select 
    (SUM(CASE WHEN `Transaction Type` = 'Credit' THEN Amount ELSE 0 END) -
     SUM(CASE WHEN `Transaction Type` = 'Debit' THEN Amount ELSE 0 END)) 
     AS Net_Transaction_Amount
FROM `debit credit cleaned data`;


-- Account Activity Ratio
select round((count(*) / sum(balance)),5) as Account_Activity_Ratio from `debit credit cleaned data`;

-- Transaction per day
select date(`Transaction date`) as date, count(*) Transaction_per_day from `debit credit cleaned data` group by date;

-- Transaction per week and month 
select monthname(`Transaction date`) as monthname, 
week(`Transaction date`) as week,
count(*) Transaction_per_week from `debit credit cleaned data`group by monthname, week order by week; 


-- Total transaction amount by branch
select branch, format(round(sum(amount),0),"M") as Total_Transaction_Amount from `debit credit cleaned data` group by branch order by Total_Transaction_Amount desc;







