docker run --name sqlserver -p 1433:1433 -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=123ABC!345aaa' -d  mcr.microsoft.com/mssql/server:2019-latest
		                             ACCEPT_EULA

docker run --name cmssq -p 1433:1433 -d imssql

docker exec -it cmssq /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 123ABC!345aaa


