--*****************************************************************************
-- M153 Projekt
-------------------------------------------------------------------------------
-- File   : M153_Projekt_Create.sql
-- Autor  : Dario St�bi
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
  Id int identity primary key NOT NULL,
  Des varchar(15) NOT NULL
);
create table Spring (
  Id int identity primary key NOT NULL,
  Des varchar(30) NOT NULL,
  Weight float NOT NULL,
  BottomOut float NOT NULL
);
create table Housing (
  Id int identity primary key NOT NULL,
  Des varchar(30) NOT NULL,
  Material varchar(30) NOT NULL,
  Contact varchar(30) NOT NULL
);
create table Stem (
  Id int identity primary key NOT NULL,
  Des varchar(30) NOT NULL,
  Material varchar(30) NOT NULL
);
create table Switch (
  Id int identity primary key NOT NULL,
  Des varchar(30) NOT NULL,
  CreateDate date NOT NULL,
  FactoryLubed BIT NOT NULL,
  FivePin BIT NOT NULL,
  fk_HousingId int foreign key references Housing(Id) NOT NULL,
  fk_StemId int foreign key references Stem(Id) NOT NULL,
  fk_SpringId int foreign key references Spring(Id) NOT NULL
);
create table Switch_Type (
  Id int identity primary key NOT NULL,
  fk_SwitchId int foreign key references Switch(Id) NOT NULL,
  fk_TypeId int foreign key references Type(Id) NOT NULL
);