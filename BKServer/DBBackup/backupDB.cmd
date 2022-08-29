cd /d %~dp0


REM SET system configurations

SET sqlcmdPATH="C:\Program Files\Microsoft SQL Server\100\Tools\Binn\sqlcmd.exe"
SET sqlcmdPATH1=sqlcmd

SET backupFileName=backupDB.bak

SET remoteServerName=DESKTOP-EKO5D2G

REM SET POS Server IP in the local
SET SMBaddress=%remoteServerName%
SET SMBBackupFolder=DBBackup


SET remoteBackupFolder=C:\Ziitech
SET remoteDATABASEFile=%remoteBackupFolder%\%backupFileName%

SET localBackupFolder=%~dp0
SET localDATABASEFile=%localBackupFolder%%backupFileName%

SET remoteSQLInstance=%remoteServerName%\SQLEXPRESS2008R2,9899
SET remoteAccessUserName=sa
SET remoteAccessPassword=0000

SET localSQLInstance=localhost\sqlexpress2008r2,9899

SET remoteDatabaseNAME=MainDB
SET backupDBNAME=BackupDB

SET remoteDBBackupFile=\\%SMBaddress%\%SMBBackupFolder%\%backupFileName%

SET backupSQL="BACKUP DATABASE %remoteDatabaseNAME% TO DISK = '%remoteDATABASEFile%';"
SET restoreSQL="RESTORE DATABASE %backupDBNAME% FROM DISK = '%localDATABASEFile%';"


REM clean cache
del /f %localDATABASEFile%
del /f %remoteDBBackupFile%



REM add ZiiPOS account for DDA
%sqlcmdPATH% -S %remoteSQLInstance% -U %remoteAccessUserName% -P %remoteAccessPassword%  -Q %backupSQL%

copy %remoteDBBackupFile% %localDATABASEFile%


%sqlcmdPATH% -S %localSQLInstance% -Q %restoreSQL%





exit
