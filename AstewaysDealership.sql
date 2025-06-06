# ---------------------------------------------------------------------- #
# Target DBMS: MySQL                                                     #
# Project name: AstewaysDealership                                       #
# ---------------------------------------------------------------------- #
DROP DATABASE IF EXISTS AstewaysDealership;

CREATE DATABASE IF NOT EXISTS AstewaysDealership;

USE AstewaysDealership;

# ---------------------------------------------------------------------- #
# Table 1: Dealerships                                                   #
# ---------------------------------------------------------------------- #
CREATE TABLE `Dealerships` (
    `Dealership_ID` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(50),
    `Address` VARCHAR(50),
    `Phone` VARCHAR(12)
);

# ---------------------------------------------------------------------- #
# Table 2: Vehicles                                                      #
# ---------------------------------------------------------------------- #
CREATE TABLE `Vehicles` (
    `VIN` VARCHAR(20) PRIMARY KEY,
    `Year` CHAR(4),
    `Make` VARCHAR(20),
    `Model` VARCHAR(20),
    `VehicleType` VARCHAR(15),
    `Color` VARCHAR(15),
    `Odometer` INTEGER,
    `Price` DECIMAL(10,2),
    `Sold` BOOLEAN
);

# ---------------------------------------------------------------------- #
# Table 3: Inventory                                                     #
# ---------------------------------------------------------------------- #
CREATE TABLE `Inventory` (
    `Dealership_ID` INTEGER,
    `VIN` VARCHAR(20),
    FOREIGN KEY (Dealership_ID) REFERENCES Dealerships(Dealership_ID),
    FOREIGN KEY (VIN) REFERENCES Vehicles(VIN)
);

# ---------------------------------------------------------------------- #
# Table 4: Sales Contracts                                               #
# ---------------------------------------------------------------------- #
CREATE TABLE `SalesContracts` (
    `ID` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `VIN` VARCHAR(20),
    `APR` DECIMAL(5,2),
    `TermMonths` INTEGER,
    `SalesTaxAmount` DECIMAL(10,2),
    `RecordingFee` DECIMAL(10,2),
    `ProcessingFee` DECIMAL(10,2),
    `VehiclePrice` DECIMAL(10,2),
    `Finance` BOOLEAN,
    FOREIGN KEY (VIN) REFERENCES Vehicles(VIN)
);

# ---------------------------------------------------------------------- #
# Table 5: Lease Contracts                                               #
# ---------------------------------------------------------------------- #
CREATE TABLE `LeaseContracts` (
    `ID` INT AUTO_INCREMENT PRIMARY KEY,
    `VIN` VARCHAR(20),
    `APR` DECIMAL(5,2),
    `TermMonths` INTEGER,
    `ExpectedEndingValue` DECIMAL(10,2),
    `LeaseFee` DECIMAL(10,2),
    `VehiclePrice` DECIMAL(10,2),
    FOREIGN KEY (VIN) REFERENCES Vehicles(VIN)
);

# ============================================================================================================================

# ---------------------------------------------------------------------- #
# Add info into "Dealerships"                                            #
# ---------------------------------------------------------------------- #
INSERT INTO Dealerships (Name, Address, Phone) 
VALUES ('Asteway Auto Center', '123 Main St', '555-123-4567'),
	   ('Fast Track Motors', '456 Oak Ave', '555-987-6543');
      
# ---------------------------------------------------------------------- #
# Add info into "Vehicles"                                               #
# ---------------------------------------------------------------------- #      
INSERT INTO Vehicles (VIN, Year, Make, Model, VehicleType, Color, Odometer, Price, Sold) 
VALUES ('1HGCM82633A004352', '2021', 'Honda', 'Civic', 'Sedan', 'Blue', 30000, 19500.00, FALSE),
       ('1FTRX12W37FA12345', '2022', 'Ford', 'F-150', 'Truck', 'Black', 12000, 34000.00, FALSE),
       ('2T1BU4EE9DC000001', '2020', 'Toyota', 'Corolla', 'Sedan', 'White', 45000, 15000.00, TRUE);      
      
# ---------------------------------------------------------------------- #
# Add info into "Inventory"                                              #
# ---------------------------------------------------------------------- #      
INSERT INTO Inventory (Dealership_ID, VIN) 
VALUES (1, '1HGCM82633A004352'),
	   (1, '2T1BU4EE9DC000001'),
       (2, '1FTRX12W37FA12345');     

# ---------------------------------------------------------------------- #
# Add info into "Sales Contracts"                                        #
# ---------------------------------------------------------------------- #      
INSERT INTO SalesContracts (VIN, APR, TermMonths, SalesTaxAmount, RecordingFee, ProcessingFee, VehiclePrice, Finance) 
VALUES ('2T1BU4EE9DC000001', 4.99, 60, 900.00, 200.00, 150.00, 15000.00, TRUE);

# ---------------------------------------------------------------------- #
# Add info into "Lease Contracts"                                        #
# ---------------------------------------------------------------------- #  
INSERT INTO LeaseContracts (VIN, APR, TermMonths, ExpectedEndingValue, LeaseFee, VehiclePrice) 
VALUES ('1HGCM82633A004352', 3.50, 36, 10000.00, 500.00, 19500.00);