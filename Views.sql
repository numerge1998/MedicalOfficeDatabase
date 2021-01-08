USE CabinetMedical ;   
GO  
CREATE VIEW PacientiiAsistentului
AS  
SELECT a.nume as 'Nume Asistent', a.prenume as 'Prenume Asistent'  , p.nume as 'Nume pacient', p.prenume as 'Prenume Pacient'  
FROM Pacient p join Asistent a   
ON p.id_asistent = a.id_asistent 
GO 

Drop view PacientiiAsistentului

Select * from PacientiiAsistentului

Go
CREATE VIEW PacientiiDoctorului
AS  
SELECT d.nume as 'Nume Doctor', d.prenume as 'Prenume Doctor'  , p.nume as 'Nume pacient', p.prenume as 'Prenume Pacient'
FROM Pacient p join Doctor d   
ON p.id_doctor = d.id_doctor ;   
GO 

Drop view PacientiiDoctorului

Select * from PacientiiDoctorului
