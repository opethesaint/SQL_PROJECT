SELECT * FROM accounts;
SELECT * FROM customers;
SELECT * FROM transactions;

use bankdb;
-- 1.	List all customers and their account types.
SELECT c.CustomerID, c.Name,
ac.AccountType 
FROM customers c
JOIN accounts ac 
on c.CustomerID= ac.CustomerID
order by c.CustomerID;


-- 2.	Show the total balance of all accounts.
SELECT 
sum(accounts.Balance) as total_bal
from accounts;


-- 3. Find the top 5 largest transactions
SELECT 
    TransactionID,
    Amount,
    TransactionDate,
    AccountID
FROM Transactions
ORDER BY Amount DESC
LIMIT 5;


-- 4. Count how many deposits vs withdrawals occurred
SELECT 
    t.TransactionType,
    COUNT(*) AS transaction_count
FROM Transactions t
GROUP BY t.TransactionType
ORDER BY transaction_count DESC;

-- 5.	Show the average transaction amount per customer.
-- 5. Show the average transaction amount per customer
SELECT 
    c.CustomerID,
    c.Name,
    ROUND(AVG(t.Amount), 0) AS avg_transaction
FROM Customers c
JOIN Accounts a 
    ON c.CustomerID = a.CustomerID
JOIN Transactions t 
    ON a.AccountID = t.AccountID
GROUP BY c.CustomerID, c.Name
ORDER BY avg_transaction DESC;


-- 6. Find customers who have more than one account
SELECT 
    c.CustomerID,
    c.Name,
    COUNT(ac.AccountID) AS account_count
FROM Customers c
JOIN Accounts ac 
    ON c.CustomerID = ac.CustomerID
GROUP BY c.CustomerID, c.Name
HAVING COUNT(ac.AccountID) > 1
ORDER BY account_count DESC;


-- 7. List all transactions made in the last 60 days
SELECT 
    t.TransactionID,
    t.AccountID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Transactions t
WHERE t.TransactionDate >= CURDATE() - INTERVAL 60 DAY
ORDER BY t.TransactionDate DESC;


-- 8. Show the customer who made the highest deposit
SELECT 
    c.CustomerID,
    c.Name,
    MAX(t.Amount) AS highest_deposit
FROM Customers c
JOIN Accounts a 
    ON c.CustomerID = a.CustomerID
JOIN Transactions t 
    ON a.AccountID = t.AccountID
WHERE t.TransactionType = 'Deposit'
GROUP BY c.CustomerID, c.Name
ORDER BY highest_deposit DESC
LIMIT 1;


-- 9. Find the total withdrawals per account type
SELECT 
    ac.AccountType,
    SUM(t.Amount) AS total_withdrawals
FROM Accounts ac
JOIN Transactions t 
    ON ac.AccountID = t.AccountID
WHERE t.TransactionType = 'Withdrawal'
GROUP BY ac.AccountType
ORDER BY total_withdrawals DESC;

-- 10. Show monthly transaction totals for 2025
SELECT 
    MONTHNAME(t.TransactionDate) AS month_name,
    SUM(t.Amount) AS total_transactions
FROM Transactions t
WHERE YEAR(t.TransactionDate) = 2025
GROUP BY MONTH(t.TransactionDate), MONTHNAME(t.TransactionDate)
ORDER BY MONTH(t.TransactionDate);


