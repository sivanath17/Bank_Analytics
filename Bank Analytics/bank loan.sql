use bank_loan;

SELECT count(*) FROM bank_loan.`bank loan cleaned data`;

-- Total loan  Funded Amount
select format(round(sum(`funded amount`),0),"M") as Total_Loan_Funded_Amount from `bank loan cleaned data`;

-- Total loans
select count(*) from `bank loan cleaned data`;

-- Total collections
select format(round(sum(`Total pymnt`),0),"M") as Total_Collections from `bank loan cleaned data`;

-- Total Intrest
select sum(`int rate`) as Total_Intrest from `bank loan cleaned data`;

-- Average Intrest
select avg(`int rate`) as Total_Intrest from `bank loan cleaned data`;

-- Branch wise performance
select `branch name`, format(round(sum(`Funded Amount`),0),"M") as Funded_amount, 
format(round(sum(`int rate`),0),"M") as Total_Intrest, 
format(round(sum(`Total pymnt`),0),"M") as Total_payment
from `bank loan cleaned data` group by `branch name`;

-- State wise loan
select `State Name`, count(*) as loan_count , format(round(sum(`funded amount`),0),"M") as Total_funded_amount from `bank loan cleaned data` group by `state name` order by loan_count desc; 

-- Religion wise loan 
select `Religion`, count(*) as loan_count , format(round(sum(`funded amount`),0),"M") as Total_funded_amount from `bank loan cleaned data` group by `Religion` order by loan_count desc; 

-- Prodcut group wise loan
select `Purpose Category`, count(*) as loan_count , format(round(sum(`funded amount`),0),"M") as Total_funded_amount from `bank loan cleaned data` group by `Purpose Category` order by loan_count desc; 

-- Grade wise loan
select `Grrade`, count(*) as loan_count , format(round(sum(`funded amount`),0),"M") as Total_funded_amount from `bank loan cleaned data` group by `Grrade`order by Grrade;

-- Default loan count
select count(*) from `bank loan cleaned data` where `is default loan` = "Y";

-- Delinquent client count
select count(*) from `bank loan cleaned data` where `Is Delinquent loan` = "Y";

-- Delinquent loan rate
select (count(case when`Is Delinquent loan` = "Y" then 1 end) * 100/count(*)) as Delinquent_Loan_Rate from `bank loan cleaned data`;

-- Default loan rate
select (count(case when`Is Default Loan` = "Y" then 1 end) * 100/count(*)) as Default_Loan_Rate from `bank loan cleaned data`;

-- Loan status wise loan
select `Loan Status`, count(*) as loan_count , format(round(sum(`funded amount`),0),"M") as Total_funded_amount from `bank loan cleaned data` group by `loan status`;

-- Age group wise loan
select `Age`, count(*) as loan_count , format(round(sum(`funded amount`),0),"M") as Total_funded_amount from `bank loan cleaned data` group by age order by age;

-- No verified loan
select count(*) as Count from `bank loan cleaned data` where `Verification Status` = "Not Verified";
