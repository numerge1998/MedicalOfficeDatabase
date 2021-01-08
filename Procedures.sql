Use CabinetMedical

--adaugare asistent
GO
Create procedure insertAsistent (@id_asistent int, @nume varchar(50), @prenume varchar(50), @varsta int, @id_sediu int)
AS
Insert into Asistent(id_asistent, nume, prenume, varsta, id_sediu) values (@id_asistent, @nume, @prenume, @varsta, @id_sediu)

--vizualizare asistent
GO
Create procedure viewAsistent 
AS
Select * from Asistent

--modificare asistent
GO
Create procedure updateAsistent (@id_asistent int, @nume varchar(50), @prenume varchar(50), @varsta int, @id_sediu int)
AS
UPDATE Asistent set nume = @nume, prenume = @prenume, varsta = @varsta, id_sediu = @id_sediu
where id_asistent = @id_asistent

--stergere asistent
GO
Create procedure deleteAsistent (@id_asistent int)
AS
Delete from Asistent where id_asistent = @id_asistent

--numele si prenumele doctorilor care au scris retete medicale in care au folosit un medicament dat ca si parametru
Go
Create Procedure doctoriCeFolosescMed (@nume_medicament varchar(50))
AS
Select d.nume, d.prenume 
from Doctor d Join RetetaMedicala r on d.id_doctor = r.id_doctor
Join Reteta_Medicament rm on r.id_reteta = rm.id_reteta
Join Medicament m on m.id_medicament = rm.id_medicament
Where m.nume = @nume_medicament

Exec doctoriCeFolosescMed 'paracetamol'

--id-ul si numele furnizorului care furnizeaza un echipament dat ca si parametru pentru sediile din Cluj-Napoca

GO
Create Procedure furnizorPentruCluj (@nume_echipament varchar(50))
AS
Select f.id_furnizor, f.nume
From Furnizor f JOIN Furnizor_Echipament fe on f.id_furnizor = fe.id_furnizor
JOIN Echipament e on e.id_echipament = fe.id_echipament
JOIN Sediu s on s.id_sediu = f.id_sediu
Where e.nume = @nume_echipament and s.adresa like '%Cluj-Napoca%'

Exec furnizorPentruCluj 'stetoscop'

-- procedura care se va executa saptamanal si nu va lasa ca un doctor sa aiba mai mult de 10 pacienti, pacientii fiind mutati la doctorul cu cei mai putini pacienti
GO
Create Procedure doctorSuprasolicitat 
AS
Declare @idDoctorMin int, @idDoctorMax int
if((Select Top 1 count(p.id_doctor) from Doctor a Join Pacient p on a.id_doctor = p.id_doctor Group By a.id_doctor Order by count(p.id_doctor) DESC) > 10)
BEGIN
	Select Top 1  @idDoctorMin = a.id_doctor from Doctor a Join Pacient p on a.id_doctor = p.id_doctor Group By a.id_doctor Order by count(p.id_doctor)
	Select Top 1  @idDoctorMax = a.id_doctor from Doctor a Join Pacient p on a.id_doctor = p.id_doctor Group By a.id_doctor Order by count(p.id_doctor) DESC
	Update Pacient set id_doctor = @idDoctorMin where id_doctor = @idDoctorMax
END
