-- 6. Get all sales information for a specific dealer for a specific date range 
SELECT
	S.*
FROM 
	cardealershipdb.salescontracts S
JOIN
	cardealershipdb.inventory I ON (I.VIN = S.VIN)
WHERE
	I.Dealership_ID = 5 
    AND S.SaleDate BETWEEN '2024-02-11' AND '2024-04-19';