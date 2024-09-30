CREATE TABLE Doctor (
    Doctor_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Specialization VARCHAR(100),
    Address VARCHAR(255),
    Phone_Number VARCHAR(15)
);

CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Phone_Number VARCHAR(15),
    Date_of_Birth DATE
);

CREATE TABLE Prescription (
    Prescription_ID INT PRIMARY KEY,
    Patient_ID INT,
    Doctor_ID INT,
    Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);

CREATE TABLE Bill (
    Bill_ID INT PRIMARY KEY,
    Patient_ID INT,
    Amount DECIMAL(10, 2),
    Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);

CREATE TABLE Receipt (
    Receipt_ID INT PRIMARY KEY,
    Bill_ID INT,
    Amount_Paid DECIMAL(10, 2),
    Date DATE,
    FOREIGN KEY (Bill_ID) REFERENCES Bill(Bill_ID)
);

CREATE TABLE Patient_GIS (
    Patient_ID INT PRIMARY KEY,
    Latitude DECIMAL(9, 6),
    Longitude DECIMAL(9, 6),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);

CREATE TABLE Medical_Report (
    Report_ID INT PRIMARY KEY,
    Patient_ID INT,
    Doctor_ID INT,
    Date DATE,
    Diagnosis TEXT,
    Treatment TEXT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);

CREATE TABLE Test (
    Test_ID INT PRIMARY KEY,
    Report_ID INT,
    Test_Name VARCHAR(100),
    Result TEXT,
    Date DATE,
    FOREIGN KEY (Report_ID) REFERENCES Medical_Report(Report_ID)
);
