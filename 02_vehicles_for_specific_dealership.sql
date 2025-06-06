-- 2. Find all vehicles for a specific dealership 
SELECT
	V.*
FROM
	cardealershipdb.vehicles V
JOIN 
	cardealershipdb.inventory I ON (I.VIN = V.VIN)
WHERE
	I.Dealership_ID = 1;