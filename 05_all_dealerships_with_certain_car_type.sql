-- 5. Find all Dealerships that have a certain car type (i.e. Red Ford Mustang) 
SELECT
	D.*
FROM 
	cardealershipdb.dealerships D
JOIN  
	cardealershipdb.inventory I ON (I.Dealership_ID = D.Dealership_ID)
JOIN 
	cardealershipdb.vehicles V ON (V.VIN = I.VIN)
WHERE
	V.Color = 'Black'
    AND V.Make = 'Ford'
    AND V.Model = 'F-150';