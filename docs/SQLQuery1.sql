/* ============================================================
   RACEDAY DATABASE - SECTION C SQL SCRIPT
   ============================================================ */

-- Create Database


USE master;
GO

IF DB_ID('RaceDay') IS NOT NULL
BEGIN
    ALTER DATABASE RaceDay SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE RaceDay;
END;
GO

CREATE DATABASE RaceDay;
GO

USE RaceDay;
GO
/* ============================================================
   1. ORGANISER TABLE
   ============================================================ */

CREATE TABLE Organiser
(
    OrganiserID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Phone VARCHAR(20) NOT NULL UNIQUE
);
GO

/* ============================================================
   2. PARTICIPANT TABLE
   ============================================================ */

CREATE TABLE Participant
(
    ParticipantID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Phone VARCHAR(20) NOT NULL UNIQUE
);
GO

/* ============================================================
   3. EVENT TABLE
   ============================================================ */

CREATE TABLE Event
(
    EventID INT IDENTITY(1,1) PRIMARY KEY,
    OrganiserID INT NOT NULL,
    EventName VARCHAR(100) NOT NULL,
    EventDate DATE NOT NULL,
    Location VARCHAR(150) NOT NULL,
    Description VARCHAR(500),
    Status VARCHAR(20) NOT NULL DEFAULT 'Upcoming',

    CONSTRAINT FK_Event_Organiser
        FOREIGN KEY (OrganiserID)
        REFERENCES Organiser(OrganiserID),

    CONSTRAINT UQ_Event_Name_Date
        UNIQUE (EventName, EventDate)
);
GO

/* ============================================================
   4. ROUTE TABLE
   ============================================================ */

CREATE TABLE Route
(
    RouteID INT IDENTITY(1,1) PRIMARY KEY,
    EventID INT NOT NULL,
    RouteName VARCHAR(100) NOT NULL,
    DistanceKM DECIMAL(6,2) NOT NULL,
    StartPoint VARCHAR(150) NOT NULL,
    FinishPoint VARCHAR(150) NOT NULL,
    RouteDescription VARCHAR(500),

    CONSTRAINT FK_Route_Event
        FOREIGN KEY (EventID)
        REFERENCES Event(EventID),

    CONSTRAINT UQ_Route_Event_Name
        UNIQUE (EventID, RouteName)
);
GO

/* ============================================================
   5. CATEGORY TABLE
   ============================================================ */

CREATE TABLE Category
(
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    EventID INT NOT NULL,
    CategoryName VARCHAR(100) NOT NULL,
    ActivityType VARCHAR(50) NOT NULL,
    DistanceKM DECIMAL(6,2) NOT NULL,
    EntryFee DECIMAL(10,2) NOT NULL DEFAULT 0.00,

    CONSTRAINT FK_Category_Event
        FOREIGN KEY (EventID)
        REFERENCES Event(EventID),

    CONSTRAINT UQ_Category_Event_Name
        UNIQUE (EventID, CategoryName)
);
GO

/* ============================================================
   6. ENROLMENT TABLE
   ============================================================ */

CREATE TABLE Enrolment
(
    EnrolmentID INT IDENTITY(1,1) PRIMARY KEY,
    ParticipantID INT NOT NULL,
    CategoryID INT NOT NULL,
    EnrolmentDate DATE NOT NULL DEFAULT GETDATE(),
    EnrolmentStatus VARCHAR(20) NOT NULL DEFAULT 'Active',

    CONSTRAINT FK_Enrolment_Participant
        FOREIGN KEY (ParticipantID)
        REFERENCES Participant(ParticipantID),

    CONSTRAINT FK_Enrolment_Category
        FOREIGN KEY (CategoryID)
        REFERENCES Category(CategoryID),

    CONSTRAINT UQ_Enrolment_Participant_Category
        UNIQUE (ParticipantID, CategoryID)
);
GO

/* ============================================================
   7. RESULT TABLE
   ============================================================ */

CREATE TABLE Result
(
    ResultID INT IDENTITY(1,1) PRIMARY KEY,
    EnrolmentID INT NOT NULL UNIQUE,
    FinishTime TIME,
    Position INT,
    ResultStatus VARCHAR(20) NOT NULL DEFAULT 'Pending',

    CONSTRAINT FK_Result_Enrolment
        FOREIGN KEY (EnrolmentID)
        REFERENCES Enrolment(EnrolmentID)
);
GO

/* ============================================================
   INSERT SAMPLE ORGANISERS
   ============================================================ */

INSERT INTO Organiser
    (FirstName, LastName, Email, Password, Phone)
VALUES
    ('Thabo', 'Mokoena', 'thabo.mokoena@example.com', 'Pass1234', '0712345678'),
    ('Nomsa', 'Dlamini', 'nomsa.dlamini@example.com', 'Pass5678', '0723456789');
GO

/* ============================================================
   INSERT SAMPLE PARTICIPANTS
   ============================================================ */

INSERT INTO Participant
    (FirstName, LastName, Email, Password, Phone)
VALUES
    ('Sipho', 'Nkosi', 'sipho.nkosi@example.com', 'Part1234', '0734567890'),
    ('Lerato', 'Molefe', 'lerato.molefe@example.com', 'Part5678', '0745678901');
GO

/* ============================================================
   INSERT 3 EVENTS
   ============================================================ */

INSERT INTO Event
    (OrganiserID, EventName, EventDate, Location, Description, Status)
VALUES
    (1, 'Soweto Community Run', '2026-10-10', 'Soweto, Johannesburg',
     'A community road running event.', 'Upcoming'),

    (1, 'Thembisa Fun Run', '2026-11-15', 'Thembisa, Gauteng',
     'A family friendly running event.', 'Upcoming'),

    (2, 'Ekurhuleni Road Race', '2026-12-05', 'Ekurhuleni, Gauteng',
     'A competitive road running event.', 'Upcoming');
GO

/* ============================================================
   INSERT ROUTES FOR EACH EVENT
   ============================================================ */

INSERT INTO Route
    (EventID, RouteName, DistanceKM, StartPoint, FinishPoint, RouteDescription)
VALUES
    (1, 'Soweto 10KM Route', 10.00, 'Walter Sisulu Square', 'Orlando Stadium',
     'A 10 kilometre community route through Soweto.'),

    (1, 'Soweto 5KM Route', 5.00, 'Walter Sisulu Square', 'Orlando Stadium',
     'A shorter route suitable for recreational runners.'),

    (2, 'Thembisa 10KM Route', 10.00, 'Thembisa Stadium', 'Thembisa Stadium',
     'A 10 kilometre route around Thembisa.'),

    (2, 'Thembisa 5KM Route', 5.00, 'Thembisa Stadium', 'Thembisa Stadium',
     'A 5 kilometre fun run route.'),

    (3, 'Ekurhuleni 21KM Route', 21.10, 'Ekurhuleni Stadium', 'Ekurhuleni Stadium',
     'A half marathon route through Ekurhuleni.'),

    (3, 'Ekurhuleni 10KM Route', 10.00, 'Ekurhuleni Stadium', 'Ekurhuleni Stadium',
     'A 10 kilometre competitive route.');
GO

/* ============================================================
   INSERT CATEGORIES FOR EACH EVENT
   ============================================================ */

INSERT INTO Category
    (EventID, CategoryName, ActivityType, DistanceKM, EntryFee)
VALUES
    (1, '10KM Open', 'Running', 10.00, 100.00),
    (1, '5KM Fun Run', 'Running', 5.00, 50.00),

    (2, '10KM Open', 'Running', 10.00, 80.00),
    (2, '5KM Family Run', 'Running', 5.00, 40.00),

    (3, 'Half Marathon', 'Running', 21.10, 150.00),
    (3, '10KM Race', 'Running', 10.00, 100.00);
GO

/* ============================================================
   INSERT SAMPLE ENROLMENTS
   ============================================================ */

INSERT INTO Enrolment
    (ParticipantID, CategoryID, EnrolmentDate, EnrolmentStatus)
VALUES
    (1, 1, '2026-09-01', 'Active'),
    (2, 2, '2026-09-02', 'Active'),
    (1, 3, '2026-09-03', 'Active'),
    (2, 5, '2026-09-04', 'Active');
GO

/* ============================================================
   INSERT SAMPLE RESULTS
   ============================================================ */

INSERT INTO Result
    (EnrolmentID, FinishTime, Position, ResultStatus)
VALUES
    (1, '00:52:30', 3, 'Completed'),
    (2, '00:31:45', 1, 'Completed'),
    (3, '00:55:10', 5, 'Completed'),
    (4, '01:48:20', 2, 'Completed');
GO

/* ============================================================
   TEST THE DATABASE
   ============================================================ */

SELECT * FROM Organiser;
SELECT * FROM Participant;
SELECT * FROM Event;
SELECT * FROM Route;
SELECT * FROM Category;
SELECT * FROM Enrolment;
SELECT * FROM Result;
GO