-- create and select the new database
--create database IKPortal

use IKPortal


-- tables

-- Users table
create table TblUsers(
	UserCode numeric(18, 0) primary key identity,
	Username nvarchar(50) Unique,
	Password nvarchar(50)
)

-- to make any table user specific, add the following foreign key line to the desired table
-- << UserCode numeric(18, 0) Foreign key references TblUsers(UserCode), >>



-- Companies table
create table TblCompanies(
	CompanyCode numeric(18, 0) primary key identity,
	Date date,
	CompanyName nvarchar(100),
	Address nvarchar(200),
	LocationLinks nvarchar(MAX)
)


-- Designations Table
create table TblDesignations(
	DesignationCode int primary key identity,
	Designation nvarchar(50)
)


-- Programs table 
create table TblPrograms(
	ProgramCode numeric(18, 0) primary key identity,
	Program nvarchar(50)
)


-- Employees table
create table TblEmployees(
	EmployeeCode numeric(18, 0) primary key identity,
	Date date,
	CompanyCode numeric(18, 0) foreign key references TblCompanies(CompanyCode),
	Name nvarchar(100),
	Email nvarchar(50),
	DesignationCode int foreign key references TblDesignations(DesignationCode),
	Contact1 nvarchar(20),
	Contact2 nvarchar(20),
	PTCL nvarchar(20),
	Anydesk nvarchar(MAX),
	ProgramCode numeric(18, 0) foreign key references TblPrograms(ProgramCode),
	Address nvarchar(200),
	LocationLinks nvarchar(MAX),
	Description nvarchar(500)
)



-- Query for View
--View name : QryEmployeeDetails
/**


SELECT        dbo.TblEmployees.EmployeeCode, dbo.TblEmployees.Date, dbo.TblCompanies.CompanyCode, dbo.TblCompanies.CompanyName, dbo.TblEmployees.Name AS EmployeeName, dbo.TblDesignations.DesignationCode, 
                         dbo.TblDesignations.Designation, dbo.TblEmployees.Contact1, dbo.TblEmployees.Contact2, dbo.TblEmployees.PTCL, dbo.TblEmployees.Anydesk, dbo.TblPrograms.ProgramCode, dbo.TblPrograms.Program, 
                         dbo.TblEmployees.Email, dbo.TblEmployees.Address, dbo.TblEmployees.LocationLinks, dbo.TblEmployees.Description
FROM            dbo.TblCompanies INNER JOIN
                         dbo.TblEmployees ON dbo.TblCompanies.CompanyCode = dbo.TblEmployees.CompanyCode INNER JOIN
                         dbo.TblDesignations ON dbo.TblEmployees.DesignationCode = dbo.TblDesignations.DesignationCode INNER JOIN
                         dbo.TblPrograms ON dbo.TblEmployees.ProgramCode = dbo.TblPrograms.ProgramCode

**/