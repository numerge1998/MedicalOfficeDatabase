--joburi + backup

/* full backup */
BACKUP DATABASE CabinetMedical
    TO DISK = 'E:\an4\sem1\ABD\Proiect\CabinetMedical.bak'   
   
GO  

USE msdb;
GO

EXEC dbo.sp_add_job	
		@job_name = N'DailyFullBackupProject';

GO
EXEC sp_add_jobstep	
	@job_name = N'DailyFullBackupProject',
	@step_name = N'FullBackupDatabase',
	@subsystem = N'TSQL',
	@command = N'BACKUP DATABASE foodmart TO DISK =
	''E:\an4\sem1\ABD\Proiect\CabinetMedical.bak'' ',
	@retry_attempts = 5,
	@retry_interval = 5;

GO
EXEC dbo.sp_add_schedule
	@schedule_name = N'RunFullDaily1',
	@freq_type = 4,
	@freq_interval = 1,	
	@active_start_date = null,
	@active_start_time = 000000;
USE msdb;

GO
EXEC sp_attach_schedule
	@job_name = N'DailyFullBackupProject',
	@schedule_name = N'RunFullDaily1'
GO
EXEC dbo.sp_add_jobserver
	@job_name = N'DailyFullBackupProject';
GO/* differential backup */BACKUP DATABASE foodmart
    TO DISK = 'E:\an4\sem1\ABD\Proiect\cabinetMedical_diff.bak'   
    WITH DIFFERENTIAL;  
GO  

USE msdb;
GO

EXEC dbo.sp_add_job	
		@job_name = N'MonthlyDiffBackupProject';

GO
EXEC sp_add_jobstep	
	@job_name = N'MonthlyDiffBackupProject',
	@step_name = N'DiffBackupDatabase',
	@subsystem = N'TSQL',
	@command = N'BACKUP DATABASE foodmart TO DISK =
	''E:\an4\sem1\ABD\Proiect\cabinetMedical_diff.bak'' WITH DIFFERENTIAL',
	@retry_attempts = 5,
	@retry_interval = 5;

GO
EXEC dbo.sp_add_schedule
	@schedule_name = N'RunDiffMonthly2',
	@freq_type = 16,
	@freq_interval = 1,	
	@freq_recurrence_factor = 1,
	@active_start_date = null,
	@active_start_time = 000000;
USE msdb;

GO
EXEC sp_attach_schedule
	@job_name = N'MonthlyDiffBackupProject',
	@schedule_name = N'RunDiffMonthly2'
GO
EXEC dbo.sp_add_jobserver
	@job_name = N'MonthlyDiffBackupProject';
GO
/* transaction log backup */
 

 BACKUP LOG foodmart
    TO DISK = 'E:\an4\sem1\ABD\Proiect\cabinetMedical_log.bak'   
    
GO  

USE msdb;
GO

EXEC dbo.sp_add_job	
		@job_name = N'WeeklyLogBackupProject';

GO
EXEC sp_add_jobstep	
	@job_name = N'WeeklyLogBackupProject',
	@step_name = N'LogBackupDatabase',
	@subsystem = N'TSQL',
	@command = N'BACKUP LOG foodmart TO DISK =
	''E:\an4\sem1\ABD\Proiect\cabinetMedical_log.bak''',
	@retry_attempts = 5,
	@retry_interval = 5;

GO
EXEC dbo.sp_add_schedule
	@schedule_name = N'RunLogWeekly3',
	@freq_type = 8,
	@freq_interval = 1,	
	@freq_recurrence_factor = 1,
	@active_start_date = null,
	@active_start_time = 000000;
USE msdb;

GO
EXEC sp_attach_schedule
	@job_name = N'WeeklyLogBackupProject',
	@schedule_name = N'RunLogWeekly3'
GO
EXEC dbo.sp_add_jobserver
	@job_name = N'WeeklyLogBackupProject';
GO

-- job care se executa saptamanal si executa procedura pentru doctori suprasolicitati

EXEC dbo.sp_add_job	
		@job_name = N'WeeklyDoctorSuprasolicitat';

GO
EXEC sp_add_jobstep	
	@job_name = N'WeeklyDoctorSuprasolicitat',
	@step_name = N'Execute procedure',
	@subsystem = N'TSQL',
	@command = N'Exec doctorSuprasolicitat ',
	@retry_attempts = 5,
	@retry_interval = 5;

GO
EXEC dbo.sp_add_schedule
	@schedule_name = N'RunLogWeekly4',
	@freq_type = 8,
	@freq_interval = 1,	
	@freq_recurrence_factor = 1,
	@active_start_date = null,
	@active_start_time = 000000;
USE msdb;

GO
EXEC sp_attach_schedule
	@job_name = N'WeeklyDoctorSuprasolicitat',
	@schedule_name = N'RunLogWeekly4'
GO
EXEC dbo.sp_add_jobserver
	@job_name = N'WeeklyDoctorSuprasolicitat';
GO
