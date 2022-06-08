--*****************************************************************************
-- M153 Projekt
-------------------------------------------------------------------------------
-- File   : M153_Projekt_Create.sql
-- Autor  : Dario Stübi
-- Datum  : 08.06.3022
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
go
-------------------------------------------------------------------------------
-- Trigger erstellen
-------------------------------------------------------------------------------
alter table Switch_Type nocheck constraint FK__Switch_Ty__fk_Sw__30F848ED
go

create trigger DeleteSwitch on Switch for delete as
begin
  delete from Switch_Type where fk_SwitchId IN (select Id from deleted)
end
go
-------------------------------------------------------------------------------
-- Stored Procedure sp_InsertStem erstellen
-------------------------------------------------------------------------------
drop procedure if exists sp_InsertStem
go

create procedure sp_InsertStem
  @Des varchar(30),
  @Material varchar(30)
as begin
  insert into Stem (Des, Material) VALUES (@Des, @Material)
end
go

-------------------------------------------------------------------------------
-- Stored Procedure sp_CountAmountOfType erstellen
-------------------------------------------------------------------------------
drop procedure if exists sp_CountAmountOfType
go

create procedure sp_CountAmountOfType
  @Type int
as begin
  declare @AmountOfType int
  if(@Type < 4)
    begin
      select @AmountOfType = COUNT(Switch_Type.fk_TypeId)
      from Switch_Type
      where Switch_Type.fk_TypeId = @Type
      return @AmountOfType;
    end
  else select 'Gib einen gültigen Typ an'
end
go