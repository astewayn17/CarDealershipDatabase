-- 4. Find the dealership where a certain car is located, by VIN 
SELECT
	D.*
FROM
	cardealershipdb.dealerships D
JOIN
	cardealershipdb.inventory I ON (I.Dealership_ID = D.Dealership_ID)
WHERE
	I.VIN = '4JGFB7BB7MA123456';