--admin role/////////////////////////////////////////////////

CREATE LOGIN admin_user
WITH PASSWORD = 'admin';

GO

CREATE USER admin_user FOR LOGIN admin_user;
GO

CREATE ROLE admin_role

EXEC sys.sp_addrolemember
	@rolename = N'admin_role',
	@membername = N'admin_user'
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON Asistent TO admin_user
GRANT SELECT, INSERT, UPDATE, DELETE ON Doctor TO admin_user
GRANT SELECT, INSERT, UPDATE, DELETE ON Echipament TO admin_user
GRANT SELECT, INSERT, UPDATE, DELETE ON Furnizor TO admin_user
GRANT SELECT, INSERT, UPDATE, DELETE ON Furnizor_Echipament TO admin_user
GRANT SELECT, INSERT, UPDATE, DELETE ON Medicament TO admin_user
GRANT SELECT, INSERT, UPDATE, DELETE ON Pacient TO admin_user
GRANT SELECT, INSERT, UPDATE, DELETE ON Program TO admin_user
GRANT SELECT, INSERT, UPDATE, DELETE ON Reteta_Medicament TO admin_user
GRANT SELECT, INSERT, UPDATE, DELETE ON RetetaMedicala TO admin_user
GRANT SELECT, INSERT, UPDATE, DELETE ON Sediu TO admin_user


ALTER ROLE admin_role ADD MEMBER admin_user

EXECUTE AS LOGIN = 'admin_user'
SELECT SUSER_NAME(), USER_NAME();  

REVERT;

--doctor role ////////////////////////

CREATE LOGIN doctor_user
WITH PASSWORD = 'doctor';

GO

CREATE USER doctor_user FOR LOGIN doctor_user;
GO

CREATE ROLE doctor_role

EXEC sys.sp_addrolemember
	@rolename = N'doctor_role',
	@membername = N'doctor_user'
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON Asistent TO doctor_user
GRANT SELECT, INSERT, UPDATE, DELETE ON Doctor TO doctor_user
GRANT SELECT ON Echipament TO doctor_user
GRANT SELECT ON Furnizor TO doctor_user
GRANT SELECT ON Furnizor_Echipament TO doctor_user
GRANT SELECT, INSERT, UPDATE, DELETE ON Medicament TO doctor_user
GRANT SELECT, INSERT, UPDATE, DELETE ON Pacient TO doctor_user
GRANT SELECT, INSERT, UPDATE, DELETE ON Program TO doctor_user
GRANT SELECT, INSERT, UPDATE, DELETE ON Reteta_Medicament TO doctor_user
GRANT SELECT, INSERT, UPDATE, DELETE ON RetetaMedicala TO doctor_user
GRANT SELECT ON Sediu TO doctor_user


ALTER ROLE doctor_role ADD MEMBER doctor_user

EXECUTE AS LOGIN = 'doctor_user'
SELECT SUSER_NAME(), USER_NAME();  
Insert into Furnizor (id_furnizor, nume) values (5, 'noul')
Delete from Furnizor where nume = 'noul'
REVERT;

--asistent role////////////////////////////////////////////////////

CREATE LOGIN asistent_user
WITH PASSWORD = 'asistent';

GO

CREATE USER asistent_user FOR LOGIN asistent_user;
GO

CREATE ROLE asistent_role

EXEC sys.sp_addrolemember
	@rolename = N'asistent_role',
	@membername = N'asistent_user'
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON Asistent TO asistent_user
GRANT SELECT ON Doctor TO asistent_user
GRANT SELECT ON Echipament TO asistent_user
GRANT SELECT ON Furnizor TO asistent_user
GRANT SELECT ON Furnizor_Echipament TO asistent_user
GRANT SELECT, INSERT, UPDATE, DELETE ON Medicament TO asistent_user
GRANT SELECT, INSERT, UPDATE, DELETE ON Pacient TO asistent_user
GRANT SELECT, INSERT, UPDATE, DELETE ON Program TO asistent_user
GRANT SELECT ON Reteta_Medicament TO asistent_user
GRANT SELECT ON RetetaMedicala TO asistent_user
GRANT SELECT ON Sediu TO asistent_user


ALTER ROLE asistent_role ADD MEMBER asistent_user

EXECUTE AS LOGIN = 'asistent_user'
SELECT SUSER_NAME(), USER_NAME();  
REVERT;

--pacient role///////////////////////////////////////////

CREATE LOGIN pacient_user
WITH PASSWORD = 'pacient';

GO

CREATE USER pacient_user FOR LOGIN pacient_user;
GO

CREATE ROLE pacient_role

EXEC sys.sp_addrolemember
	@rolename = N'pacient_role',
	@membername = N'pacient_user'
GO

GRANT SELECT ON Asistent TO pacient_user
GRANT SELECT ON Doctor TO pacient_user
GRANT SELECT ON Echipament TO pacient_user
GRANT SELECT ON Furnizor TO pacient_user
GRANT SELECT ON Furnizor_Echipament TO pacient_user
GRANT SELECT ON Medicament TO pacient_user
GRANT SELECT ON Pacient TO pacient_user
GRANT SELECT ON Program TO pacient_user
GRANT SELECT ON Reteta_Medicament TO pacient_user
GRANT SELECT ON RetetaMedicala TO pacient_user
GRANT SELECT ON Sediu TO pacient_user


ALTER ROLE pacient_role ADD MEMBER pacient_user

EXECUTE AS LOGIN = 'pacient_user'
SELECT SUSER_NAME(), USER_NAME();  
REVERT;