# ---------------------------------------------------------------------- #
# Target DBMS: MySQL                                                     #
# Project name: AstewaysDealership                                       #
# ---------------------------------------------------------------------- #
DROP DATABASE IF EXISTS CarDealershipDB;

CREATE DATABASE IF NOT EXISTS CarDealershipDB;

USE CarDealershipDB;

# ---------------------------------------------------------------------- #
# Table 1: Dealerships                                                   #
# ---------------------------------------------------------------------- #
CREATE TABLE `Dealerships` (
    `Dealership_ID` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(50) NOT NULL,
    `Address` VARCHAR(50),
    `Phone` VARCHAR(16)
);

# ---------------------------------------------------------------------- #
# Table 2: Vehicles                                                      #
# ---------------------------------------------------------------------- #
CREATE TABLE `Vehicles` (
    `VIN` VARCHAR(20) PRIMARY KEY NOT NULL,
    `Year` YEAR NOT NULL,
    `Make` VARCHAR(20) NOT NULL,
    `Model` VARCHAR(20) NOT NULL,
    `VehicleType` VARCHAR(15),
    `Color` VARCHAR(15),
    `Odometer` INTEGER NOT NULL,
    `Price` DECIMAL(10,2) NOT NULL,
    `Sold` BOOLEAN NOT NULL
);

# ---------------------------------------------------------------------- #
# Table 3: Inventory                                                     #
# ---------------------------------------------------------------------- #
CREATE TABLE `Inventory` (
	`Inventory_ID` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `Dealership_ID` INTEGER NOT NULL,
    `VIN` VARCHAR(20) NOT NULL,
    CONSTRAINT `FK_Inventory_Dealer` FOREIGN KEY (`Dealership_ID`) REFERENCES `Dealerships`(`Dealership_ID`),
    CONSTRAINT `FK_Inventory_Vehicle` FOREIGN KEY (`VIN`) REFERENCES `Vehicles`(`VIN`)
);

# ---------------------------------------------------------------------- #
# Table 4: Sales Contracts                                               #
# ---------------------------------------------------------------------- #
CREATE TABLE `SalesContracts` (
    `ID` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `VIN` VARCHAR(20) NOT NULL,
    `APR` DECIMAL(5,2),
    `SaleDate` DATE NOT NULL,
    `TermMonths` INTEGER,
    `SalesTaxAmount` DECIMAL(10,2) NOT NULL,
    `RecordingFee` DECIMAL(10,2) NOT NULL,
    `ProcessingFee` DECIMAL(10,2) NOT NULL,
    `VehiclePrice` DECIMAL(10,2) NOT NULL,
    `Finance` BOOLEAN,
	CONSTRAINT `FK_Sales_Vehicle` FOREIGN KEY (`VIN`) REFERENCES `Vehicles`(`VIN`)
);

# ---------------------------------------------------------------------- #
# Table 5: Lease Contracts                                               #
# ---------------------------------------------------------------------- #
CREATE TABLE `LeaseContracts` (
    `ID` INT AUTO_INCREMENT PRIMARY KEY,
    `VIN` VARCHAR(20) NOT NULL,
    `APR` DECIMAL(5,2) NOT NULL,
    `LeaseDate` DATE NOT NULL,
    `TermMonths` INTEGER NOT NULL,
    `ExpectedEndingValue` DECIMAL(10,2) NOT NULL,
    `LeaseFee` DECIMAL(10,2) NOT NULL,
    `VehiclePrice` DECIMAL(10,2) NOT NULL,
    CONSTRAINT `FK_Lease_Vehicle` FOREIGN KEY (`VIN`) REFERENCES `Vehicles`(`VIN`)
);

# ============================================================================================================================

# ---------------------------------------------------------------------- #
# Add info into "Dealerships"                                            #
# ---------------------------------------------------------------------- #
INSERT INTO Dealerships (`Name`, `Address`, `Phone`) 
VALUES ('Asteway Auto Center', '123 Main St', '555-123-4567'),
	   ('Fast Track Motors', '456 Oak Ave', '555-987-6543'),
	   ('Mountain Motors', '789 Ridge Rd', '555-222-1111'),
       ('City Auto Plaza', '321 Urban Blvd', '555-333-2222'),
       ('Sunset Cars & Trucks', '654 Sunset Dr', '555-444-3333');
      
# ---------------------------------------------------------------------- #
# Add info into "Vehicles"                                               #
# ---------------------------------------------------------------------- #      
INSERT INTO Vehicles (`VIN`, `Year`, `Make`, `Model`, `VehicleType`, `Color`, `Odometer`, `Price`, `Sold`) 
VALUES ('1HGCM82633A004352', 2021, 'Honda', 'Civic', 'Sedan', 'Blue', 30000, 19500.00, FALSE),
       ('1FTRX12W37FA12345', 2022, 'Ford', 'F-150', 'Truck', 'Black', 12000, 34000.00, FALSE),
       ('2T1BU4EE9DC000001', 2020, 'Toyota', 'Corolla', 'Sedan', 'White', 45000, 15000.00, TRUE),
       ('ZFF67NFA6F0201234', 2018, 'Ferrari', '458 Italia', 'Coupe', 'Red', 12000, 230000.00, TRUE),
	   ('SCFRMFAV3JGL12345', 2019, 'Aston Martin', 'DB11', 'Coupe', 'Midnight Blue', 8000, 210000.00, FALSE),
       ('WDDUG8CBXLA123456', 2020, 'Mercedes-Benz', 'S63 AMG', 'Sedan', 'Black', 14000, 170000.00, FALSE),
       ('WAUZZZF53KA012345', 2021, 'Audi', 'R8 V10 Plus', 'Coupe', 'White', 9000, 195000.00, TRUE),
       ('WBS8M9C58J5L12345', 2022, 'BMW', 'M8 Competition', 'Coupe', 'Gray', 7000, 165000.00, FALSE),
       ('ZHWUF5ZF7MLA12345', 2021, 'Lamborghini', 'Huracan EVO', 'Coupe', 'Lime Green', 6000, 280000.00, TRUE),
       ('WP0AB2A94MS123456', 2021, 'Porsche', '911 Turbo S', 'Coupe', 'Silver', 5000, 220000.00, FALSE),
       ('4JGFB7BB7MA123456', 2022, 'Mercedes-Benz', 'GLE 63 S', 'SUV', 'White', 10000, 145000.00, TRUE),
       ('SCA665C55EUX12345', 2020, 'Bentley', 'Continental GT', 'Coupe', 'Burgundy', 11000, 250000.00, FALSE),
       ('JHMZF1D49ES123456', 2019, 'Acura', 'NSX', 'Coupe', 'Blue', 8500, 160000.00, TRUE);
      
# ---------------------------------------------------------------------- #
# Add info into "Inventory"                                              #
# ---------------------------------------------------------------------- #      
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (1, '1HGCM82633A004352'),
       (1, '2T1BU4EE9DC000001'),
       (2, '1FTRX12W37FA12345'),   
       (3, 'ZFF67NFA6F0201234'),
       (3, 'SCFRMFAV3JGL12345'),
       (4, 'WDDUG8CBXLA123456'),
       (4, 'WAUZZZF53KA012345'),
       (4, 'WBS8M9C58J5L12345'),
       (5, 'ZHWUF5ZF7MLA12345'),
       (5, 'WP0AB2A94MS123456'),
       (5, '4JGFB7BB7MA123456'),
       (3, 'SCA665C55EUX12345'),
       (2, 'JHMZF1D49ES123456');

# ---------------------------------------------------------------------- #
# Add info into "Sales Contracts"                                        #
# ---------------------------------------------------------------------- #      
INSERT INTO SalesContracts (`VIN`, `APR`, `SaleDate`, `TermMonths`, `SalesTaxAmount`, `RecordingFee`, `ProcessingFee`, `VehiclePrice`, `Finance`) 
VALUES ('2T1BU4EE9DC000001', 4.99, '2024-12-01', 60, 900.00, 200.00, 150.00, 15000.00, TRUE),
       ('ZFF67NFA6F0201234', 2.99, '2024-05-15', 60, 13800.00, 500.00, 300.00, 230000.00, TRUE),
       ('WAUZZZF53KA012345', NULL, '2024-03-22', NULL, 11700.00, 450.00, 250.00, 195000.00, FALSE),
       ('ZHWUF5ZF7MLA12345', 3.25, '2024-04-18', 48, 16800.00, 600.00, 300.00, 280000.00, TRUE),
	   ('4JGFB7BB7MA123456', NULL, '2024-02-12', NULL, 8700.00, 350.00, 250.00, 145000.00, FALSE),
       ('JHMZF1D49ES123456', 3.10, '2023-11-01', 60, 9600.00, 400.00, 250.00, 160000.00, TRUE);

# ---------------------------------------------------------------------- #
# Add info into "Lease Contracts"                                        #
# ---------------------------------------------------------------------- #  
INSERT INTO LeaseContracts (`VIN`, `APR`, `LeaseDate`, `TermMonths`, `ExpectedEndingValue`, `LeaseFee`, `VehiclePrice`) 
VALUES ('1HGCM82633A004352', 3.50, '2024-11-15', 36, 10000.00, 500.00, 19500.00),
       ('SCFRMFAV3JGL12345', 3.50, '2024-06-20', 36, 110000.00, 1200.00, 210000.00),
       ('WDDUG8CBXLA123456', 3.20, '2024-07-15', 36, 95000.00, 1000.00, 170000.00),
       ('WBS8M9C58J5L12345', 3.75, '2024-08-05', 36, 90000.00, 1100.00, 165000.00),
       ('WP0AB2A94MS123456', 3.40, '2024-09-01', 36, 120000.00, 1300.00, 220000.00),
       ('SCA665C55EUX12345', 3.90, '2024-10-12', 36, 130000.00, 1400.00, 250000.00);
