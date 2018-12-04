kwvcprojparser Afd.sln -c "Debug|Win32" -o kwinject.12.out
kwadmin create-project afd
rem kwadmin set-project-property afdialer source_encoding ISO-8859-1
kwbuildproject --project afd -o table -f kwinject.12.out
kwadmin load afd table
