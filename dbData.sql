Use CabinetMedical
Go
Insert into Sediu (id_sediu, adresa) values (1, 'Cluj-Napoca, strada garii nr 1')
Insert into Asistent (id_asistent, nume, prenume, varsta, id_sediu) values (1, 'Pop', 'Ioan', 33, 1)
Insert into Asistent (id_asistent, nume, prenume, varsta, id_sediu) values (2, 'Popa', 'George', 44, 1)
Insert into Doctor (id_doctor, nume, prenume, varsta, id_sediu) values (1, 'Lung', 'Paula', 22, 1)
Insert into Doctor (id_doctor, nume, prenume, varsta, id_sediu) values (2, 'Lung', 'Radu', 42, 1)
Insert into Doctor (id_doctor, nume, prenume, varsta, id_sediu) values (3, 'Lung', 'Radu', 42, 1)
Insert into Pacient (id_pacient, nume, prenume, cnp, varsta, data_nasterii, id_asistent, id_doctor) values (1, 'Pop', 'Alin', '1981019125784', 22, '1998-10-19', 1, 1)
Insert into Pacient (id_pacient, nume, prenume, cnp, varsta, data_nasterii, id_asistent, id_doctor) values (2, 'Popa', 'Dragos', '1951019125724', 25, '2000-11-10', 1, 1)
Insert into Pacient (id_pacient, nume, prenume, cnp, varsta, data_nasterii, id_asistent, id_doctor) values (3, 'Dan', 'Ioan', '1201110125123', 25, '2000-11-10', 1, 2)
Insert into Pacient (id_pacient, nume, prenume, cnp, varsta, data_nasterii, id_asistent, id_doctor) values (4, 'Dan', 'Daniel', '1901110125127', 25, '1990-11-10', 2, 2)
Insert into Pacient (id_pacient, nume, prenume, cnp, varsta, data_nasterii, id_asistent, id_doctor) values (5, 'Muresan', 'Sergiu', '1901110125127', 25, '1990-11-10', 1, 1)
Insert into Pacient (id_pacient, nume, prenume, cnp, varsta, data_nasterii, id_asistent, id_doctor) values (6, 'Muntean', 'Ioana', '1901110125127', 34, '1990-11-10', 1, 3)
Insert into Furnizor (id_furnizor, nume, id_sediu) values (1, 'Med SRL', 1)
Insert into Furnizor_Echipament (id_furnizor, id_echipament) values (1, 1)
Insert into Echipament (id_echipament, nume, cantitate, id_sediu) values (1, 'Stetoscop', 10, 1)

