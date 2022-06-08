--*****************************************************************************
-- M153 Projekt
-------------------------------------------------------------------------------
-- File   : M153_Projekt_Insert.sql
-- Autor  : Luca Aeberhard
-- Datum  : 25.05.3022
-- System : T-SQL
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Tabelle abfüllen
-------------------------------------------------------------------------------

insert into Type (Des)						
values	('Clicky'), ('Tactile'), ('Linear');

insert into Housing	(Des, Material, Contact)	
values	('Gateron Nyli', 'Nylon', 'Gold'),
		('Alpaca housing', 'PC/POM', 'Gold'),
		('Durock', 'Nylon', 'Gold')

insert into Stem (Des, Material)
values	('Gateron POM', 'POM'),
		('Alpaca stem', 'POM'),
		('Lavender stem', 'POM'),
		('Click durock stem', 'Nylon'),
		('Tactile durock stem', 'Nylon')

insert into Spring (Des, Weight, BottomOut)	
values	('Double extended spring', 58, 3.4),
		('Heavy Gateron', 62, 3.5),
		('Alpaca spring', 62, 2.4),
		('Lavender Spring', 57, 3.5)

insert into Switch (Des, CreateDate, FactoryLubed, FivePin, fk_HousingId, fk_StemId, fk_SpringId)				
values	('Gateron Camping', '2021-05-22', 1, 1, 1, 1, 1),
		('Gateron Oil King Black', '2022-03-23', 1, 0, 1, 1, 2),
		('Alpaca','2019-12-02', 1, 1, 2, 2, 3),
		('Cannonkeys Lavender', '2021-06-12', 1, 1, 3, 3, 4),
		('Durock C1', '2018-07-17', 0, 1, 3, 4, 1),
		('Durock T1', '2018-07-17', 1, 1, 3, 5, 1)

insert into Switch_Type	(fk_SwitchId, fk_TypeId)
values	(1, 3),
		(2, 3),
		(3, 3),
		(4, 3),
		(5, 1),
		(5, 2),
		(6, 2)
go 

