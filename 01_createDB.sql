IF DB_ID('JustForGiggles_Test') IS NULL
Create Database JustForGiggles_Test
;

USE JustForGiggles_Test

Create Table patient
(
    _id int Identity (1,1) NOT NULL
)
;