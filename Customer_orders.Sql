
SELECT O.[Order Number]
      ,O.[Purchase_Amount]
      ,O.[Order Date]
      ,O.[Customer ID]
      ,O.[Salesman_id]
      ,C. [Customer_Name]
      ,C. [City]
      ,C.[Grade]
      , S.[Name]
      ,s.[commission]
  FROM [dbo].[Order$] AS O
  JOIN [dbo].[Customer$] AS C
  ON  O.[Salesman_id] = C.[Salesman_ID]
  JOIN [dbo].[Salesman$] AS S
  ON  O.[Salesman_id] =S.[Salesman_id]

--write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
   SELECT
       C. [Customer_Name]
      ,C. [City]
      , S.[Name]
  FROM [dbo].[Order$] AS O
  JOIN [dbo].[Customer$] AS C
  ON  O.[Salesman_id] = C.[Salesman_ID]
  JOIN [dbo].[Salesman$] AS S
  ON  O.[Salesman_id] =S.[Salesman_id]
  order by [city]


--write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.

SELECT O.[Order Number]
      ,O.[Purchase_Amount]
      ,C. [Customer_Name]
      ,C. [City]
  FROM [dbo].[Order$] AS O
  JOIN [dbo].[Customer$] AS C
  ON  O.[Salesman_id] = C.[Salesman_ID]
  JOIN [dbo].[Salesman$] AS S
  ON  O.[Salesman_id] =S.[Salesman_id]
  WHERE [Purchase_Amount] between 500 and 2000

--write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.

SELECT 
       C. [Customer_Name]
      ,C. [City]
      , S.[Name]
      ,s.[commission]
  FROM [dbo].[Order$] AS O
  JOIN [dbo].[Customer$] AS C
  ON  O.[Salesman_id] = C.[Salesman_ID]
  JOIN [dbo].[Salesman$] AS S
  ON  O.[Salesman_id] =S.[Salesman_id]

--write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission. 

 SELECT 
      C.[Customer_Name]
      ,C. [City]
      , S.[Name]
      ,S.[commission]
  FROM [dbo].[Order$] AS O
  JOIN [dbo].[Customer$] AS C
  ON  O.[Salesman_id] = C.[Salesman_ID]
  JOIN [dbo].[Salesman$] AS S
  ON  O.[Salesman_id] =S.[Salesman_id]
  WHERE [commission] >= .13
  
--write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission. 

SELECT 
       C. [Customer_Name]
      ,C. [City]
      , S.[Name]
      ,s.[commission]
      ,s.[city]
  FROM [dbo].[Order$] AS O
  JOIN [dbo].[Customer$] AS C
  ON  O.[Salesman_id] = C.[Salesman_ID]
  JOIN [dbo].[Salesman$] AS S
  ON  O.[Salesman_id] =S.[Salesman_id]
  where C.[City] = s.[city]


--write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission

SELECT O.[Order Number]
      ,O.[Purchase_Amount]
      ,O.[Order Date]
      ,C. [Customer_Name]
       ,C.[Grade]
      , S.[Name]
      ,s.[commission]
  FROM [dbo].[Order$] AS O
  JOIN [dbo].[Customer$] AS C
  ON  O.[Salesman_id] = C.[Salesman_ID]
  JOIN [dbo].[Salesman$] AS S
  ON  O.[Salesman_id] =S.[Salesman_id]

--Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned.

SELECT O.[Order Number]
      ,O.[Purchase_Amount]
      ,O.[Order Date]
      ,O.[Customer ID]
      ,O.[Salesman_id]
      ,C. [Customer_Name]
      ,C. [City]
      ,C.[Grade]
      , S.[Name]
      ,s.[commission]
      ,s.[City]
  FROM [dbo].[Order$] AS O
  JOIN [dbo].[Customer$] AS C
  ON  O.[Salesman_id] = C.[Salesman_ID]
  JOIN [dbo].[Salesman$] AS S
  ON  O.[Salesman_id] =S.[Salesman_id]

--write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.

 SELECT 
       C. [Customer_Name]
      ,C. [City]
      ,C.[Grade]
      , S.[Name]
      ,s.[city]
  FROM [dbo].[Order$] AS O
  JOIN [dbo].[Customer$] AS C
  ON  O.[Salesman_id] = C.[Salesman_ID]
  JOIN [dbo].[Salesman$] AS S
  ON  O.[Salesman_id] =S.[Salesman_id]
  order by [Customer ID] Asc
--write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id.

SELECT 
       C. [Customer_Name]
      ,C. [City]
      ,C.[Grade]
      , S.[Name]
      ,s.[city]
  FROM [dbo].[Order$] AS O
  JOIN [dbo].[Customer$] AS C
  ON  O.[Salesman_id] = C.[Salesman_ID]
  JOIN [dbo].[Salesman$] AS S
  ON  O.[Salesman_id] =S.[Salesman_id]
  WHERE [Grade] < 300
  ORDER BY [Customer_ID] ASC

--Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not.


SELECT O.[Order Number]
      ,O.[Purchase_Amount]
      ,O.[Order Date]
      ,C. [Customer_Name]
      ,C. [City]
      ,RANK() OVER(PARTITION BY [Order Date] ORDER BY [Purchase_Amount] ASC )
  FROM [dbo].[Order$] AS O
  JOIN [dbo].[Customer$] AS C
  ON  O.[Salesman_id] = C.[Salesman_ID]
  JOIN [dbo].[Salesman$] AS S
  ON  O.[Salesman_id] =S.[Salesman_id]
  
--Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.
SELECT   
    C. [Customer_Name]   
   ,S.[Name] 
  FROM [dbo].[Order$] AS O
  JOIN [dbo].[Customer$] AS C
  ON  O.[Salesman_id] = C.[Salesman_ID]
  JOIN [dbo].[Salesman$] AS S
  ON  O.[Salesman_id] =S.[Salesman_id]
  order by s.[Name] asc

--write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount.
SELECT 
      O.[Purchase_Amount]
      ,O.[Order Date]
      ,O.[Order Number]
      ,C. [Customer_Name]
      ,C. [City]
      ,C.[Grade]
      , S.[Name]  
  FROM [dbo].[Order$] AS O
  JOIN [dbo].[Customer$] AS C
  ON  O.[Salesman_id] = C.[Salesman_ID]
  JOIN [dbo].[Salesman$] AS S
  ON  O.[Salesman_id] =S.[Salesman_id]

--Write a SQL query to combine each row of the salesman table with each row of the customer table.

  SELECT *
  FROM [dbo].[Salesman$] AS S
  JOIN [dbo].[Customer$] AS C
  ON S.[Salesman_ID] =C.[Salesman_id]


--Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city.

SELECT *
FROM [dbo].[Salesman$]
CROSS JOIN [dbo].[Customer$]
