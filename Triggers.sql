--triggere DML

--un doctor sa aiba maxim 20 de pacienti
GO
Create Trigger doctorMax20PAcienti on Pacient after Insert, Update AS
IF ( (Select distinct count(p.id_doctor) from Pacient p JOIN inserted i on i.id_doctor = p.id_doctor) > 20 )
BEGIN
	RAISERROR ('Doctorul are prea multi pacienti', 16, 1);
	ROLLBACK TRANSACTION;
END;
GO
--Drop trigger doctorMax20PAcienti

--la aparitia unui nou pacient acesta va fi asignat asistentului cu cei mai putini pacienti
GO
Create Trigger pacientLaAsistentLiber on Pacient after Insert AS
Declare @idAsistent int, @idPacient int
BEGIN
	Select Top 1 @idAsistent = a.id_asistent from Asistent a Join Pacient p on a.id_asistent = p.id_asistent Group By a.id_asistent Order by count(p.id_asistent)
	Select @idPacient = i.id_pacient from inserted i
	Update Pacient set id_asistent = @idAsistent where id_pacient = @idPacient
END;
GO

--Drop trigger pacientLaAsistentLiber

--La stergerea unui Doctor, pacientii acestuia sa fie asignati doctorului cu cei mai putini pacienti
GO
Create Trigger stergereDoctorMutarePacienti on Doctor for Delete AS
Declare @idDoctor int, @idDoctorDeleted int
BEGIN
	Select Top 1 @idDoctor = d.id_doctor from Doctor d Join Pacient p on d.id_doctor = p.id_doctor Group By d.id_doctor Order by count(p.id_doctor)
	Select @idDoctorDeleted  = d.id_doctor from deleted d
	Update Pacient set id_doctor = @idDoctor where id_doctor = @idDoctorDeleted 
END;
GO

--Drop trigger stergereDoctorMutarePacienti

-- nu se poate modifica tabela Sediu
CREATE TRIGGER noChanges
ON Sediu
FOR INSERT, DELETE, UPDATE 
AS
	PRINT 'You cannot insert, delete or update data in this table'
	ROLLBACK

GO

--Drop trigger noChanges



--triggere DDL

/*
La stergerea tabelelor din baza de date curenta sa apara un mesaj de
avertisment.
*/
Create trigger ddl_delete_table on database for drop_table as
Print('Se va sterge un tabel');
GO
--Drop trigger ddl_delete_table

/*
La updatarea tabelelor din baza de date curenta sa apara un mesaj de
avertisment.
*/
Create trigger ddl_update_table on database for alter_table as
Print('Se va modifica un tabel');
GO
--Drop trigger ddl_update_table

/*
Nu se pot face stergeti sau modificari in baza de date
*/

CREATE TRIGGER safety   
ON DATABASE   
FOR DROP_TABLE, ALTER_TABLE   
AS   
   PRINT 'You must disable Trigger "safety" to drop or alter tables!'   
   ROLLBACK; 
GO
--Drop trigger safety

/*
La crearea unei tabele in baza de date curenta, sa se afiseze numele tuturor
tabelelor din baza de date si data crearii pentru fiecare tabela.
*/
Create trigger DDL_Creare_Tabele
ON Database
FOR CREATE_TABLE AS
Select name, create_date From sys.tables
Go 
--Drop trigger DDL_Creare_Tabele