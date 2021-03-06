--*****************************************************************************
-- M153 Projekt
-------------------------------------------------------------------------------
-- File   : M153_Projekt_Query.sql
-- Autor  : Luca Aeberhard & Dario Stübi
-- Datum  : 08.06.2022
-- System : T-SQL
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Trigger verwenden
-------------------------------------------------------------------------------

delete from switch where Id = 4;
go 

-------------------------------------------------------------------------------
-- Procedure sp_CountAmountOfType -> ELSE / Fehlermeldung
-------------------------------------------------------------------------------

declare @Amount int
exec @Amount = sp_CountAmountOfType @Type = 5
select Anzahl = @Amount
go

-------------------------------------------------------------------------------
-- Procedure sp_CountAmountOfType -> IF / Anzahl
-------------------------------------------------------------------------------

declare @Amount int
exec @Amount = sp_CountAmountOfType @Type = 3
select Anzahl = @Amount
go

-------------------------------------------------------------------------------
-- Procedure sp_CountAmountOfType
-------------------------------------------------------------------------------

exec sp_InsertStem 'Panda Stem', 'POM'
select * from Stem
go