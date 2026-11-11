# Shoes Store (ASP.NET Web Forms)

This repository contains the Shoes Store ASP.NET Web Forms project targeting .NET Framework 4.7.2.

## Project files
- `Shoes_Store.sln` — Visual Studio solution
- `Database_Connectivity.csproj` — ASP.NET project
- `Shoes_Database_Setup.sql` — SQL Server database setup script
- `images/` — project images

## Setup
1. Open `Shoes_Store.sln` in Visual Studio.
2. Restore NuGet packages (the project uses `packages.config`).
3. Set up the SQL Server database using `Shoes_Database_Setup.sql`.
4. Configure the LocalDB connection string in `Web.config` for your local environment.
5. Build and run the project using IIS Express.

## Important
Local Visual Studio/build folders and local database files are intentionally excluded from this public repository. Do not commit passwords, private data, API keys, or database files containing personal information.
