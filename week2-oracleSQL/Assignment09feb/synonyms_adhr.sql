-- Create Synonym

CREATE SYNONYM stocks
FOR inventories;

SELECT * FROM stocks;

-- Drop Synonym

DROP SYNONYM stocks;