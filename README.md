# Solución de proyectos ASP NET Core

En este repositorio se tienen proyectos para practicar los 
conocimientos de ASP NET Core y Entity Framework del curso 
de Udemy "Master ASP.NET Core Y React Hooks en Azure" de Vaxi Drez.


### Realizando Migraciones...

Para realizar las migraciones, primero debemos tener instalada la 
extension 'EntityFrameworkCore.Tools'
Despues ejecutamos el siguiente comando: 
```
dotnet tool install --global dotnet-ef --version 3.1.1
```

Para agregar las migraciones usamos el siguiente comando: 
```
dotnet ef migrations add IdentityCoreInitial -p Persistencia/ -s WebAPI/
```

Después en el archivo 'Program.cs' del proyecto WebAPI configuramos la funcion 
Main para primero realizar las migraciones y despues ejecutar la aplicacion.