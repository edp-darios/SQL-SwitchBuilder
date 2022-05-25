--*****************************************************************************
-- M153 Projekt
-------------------------------------------------------------------------------
-- File   : M153_Projekt_Create.sql
-- Autor  : Dario Stübi
-- Datum  : 25.05.3022
-- System : T-SQL
-------------------------------------------------------------------------------
-- Datenbank erstellen
-------------------------------------------------------------------------------
use master;
go
drop database if exists SwitchBuilder;
go
create database SwitchBuilder;
go
use SwitchBuilder;
go
-------------------------------------------------------------------------------
-- Tabelle erstellen
-------------------------------------------------------------------------------
create table Type (
  Id int identity primary key,
  Des varchar(15)
);
create table Spring (
  Id int identity primary key,
  Des varchar(30),
  Weight float,
  BottomOut float
);
create table Housing (
  Id int identity primary key,
  Des varchar(30),
  Material varchar(30),
  Contact varchar(30)
);
create table Stem (
  Id int identity primary key,
  Des varchar(30),
  Material varchar(30)
);
create table Switch (
  Id int identity primary key,
  Des varchar(30),
  CreateDate date,
  FactoryLubed BIT,
  FivePin BIT,
  fk_TopHousingId int foreign key references Housing(Id),
  fk_StemId int foreign key references Stem(Id),
  fk_SpringId int foreign key references Spring(Id)
);
create table Switch_Type (
  Id int identity primary key,
  fk_SwitchId int foreign key references Switch(Id),
  fk_TypeId int foreign key references Type(Id)
);