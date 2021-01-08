--cursoare

Declare Cursor1 scroll cursor for
Select s.adresa as 'adresa', f.nume as 'nume furnizor'
From Sediu s join Furnizor f on s.id_sediu = f.id_sediu 
Open Cursor1;

Declare @adresa_sediu varchar(50), @nume_furnizor varchar(50);

Fetch first from Cursor1 into @adresa_sediu, @nume_furnizor;

While @@FETCH_STATUS=0 
Begin
 Print ('Adresa Sediu: '+@adresa_sediu+'; Nume furnizor: '+@nume_furnizor);
 Fetch next from Cursor1 into @adresa_sediu, @nume_furnizor;
End;
 
Close Cursor1;
Deallocate Cursor1;


Declare Cursor2 scroll cursor for
Select r.numar as 'Numarul retetei', m.nume as 'nume medicament'
From Reteta_Medicament rm join RetetaMedicala r on r.id_reteta = rm.id_reteta
Join Medicament m on m.id_medicament = rm.id_medicament
Open Cursor2;

Declare @numar_reteta varchar(50), @nume_medicament varchar(50);

Fetch first from Cursor2 into @numar_reteta, @nume_medicament;

While @@FETCH_STATUS=0 
Begin
 Print ('Numar reteta: '+@numar_reteta+'; Nume medicament: '+@nume_medicament);
 Fetch next from Cursor2 into @numar_reteta, @nume_medicament;
End;
 
Close Cursor2;
Deallocate Cursor2;