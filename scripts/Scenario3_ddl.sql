/***********************************/
/*  SCENARIO 3: ETL & Reporting    */
/***********************************/

/*
Extract: 
    Load the provided files into staging tables using Python (pandas), SQL*Loader, or an ETL tool like Talend.
Transform: 
    Normalize data before loading into the final tables.
Load: 
    Insert clean data into Oracle DB.
*/

CREATE DATABASE SQLAssessmentDB;

USE SQLAssessmentDB;

CREATE TABLE Advisers (
    AdvisorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Telephone VARCHAR(20)
);


CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    AdvisorID INT,
    Name VARCHAR(100),
    Telephone VARCHAR(20),
    FOREIGN KEY (AdvisorID) REFERENCES Advisers(AdvisorID)
);


CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    Type VARCHAR(50),
    Amount DECIMAL(10,2),
    ClientID INT,
    TransactionDate DATE,
    Currency VARCHAR(10),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);