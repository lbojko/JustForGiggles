IF DB_ID('JustForGiggles_Test') IS NOT NULL
Create Database JustForGiggles_Test
;

USE JustForGiggles_Test

Create Table patient
(
    _id int Identity (1,1) NOT NULL
)
;