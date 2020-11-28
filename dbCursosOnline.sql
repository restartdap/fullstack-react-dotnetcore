USE master
go

CREATE DATABASE dbCursosOnline
go

use dbCursosOnline
go

CREATE TABLE Curso
(
	CursoId int identity(1, 1) primary key,
	Titulo nvarchar(500) not null,
	Descripcion nvarchar(1000) null,
	FechaPublicacion datetime null,
	FotoPortada varbinary(MAX) null
)
go

CREATE TABLE Precio
(
	PrecioId int identity(1, 1) primary key,
	PrecioActual money not null,
	Promocion money null,
	CursoId int not null,
	FOREIGN KEY (CursoId) REFERENCES Curso(CursoId)
)
go

CREATE TABLE Comentario
(
	ComentarioId int identity(1, 1) primary key,
	Alumno nvarchar(500) not null,
	Puntaje int not null,
	ComentarioTexto nvarchar(MAX) not null,
	CursoId int not null,
	FOREIGN KEY (CursoId) REFERENCES Curso(CursoId)
)

CREATE TABLE Instructor
(
	InstructorId int identity(1, 1) primary key,
	Nombre nvarchar(500) not null,
	Apellidos nvarchar(500) not null,
	Grado nvarchar(500) not null,
	FotoPerfil varbinary(MAX) null
)
go

/*
CREATE TABLE CursoInstructor
(
	CursoId int not null,
	InstructorId int not null,
	FOREIGN KEY (CursoId) REFERENCES Curso(CursoId), 
	FOREIGN KEY (InstructorId) REFERENCES Instructor(InstructorId), 
	PRIMARY KEY(CursoId, InstructorId)
)
go
*/

ALTER TABLE CursoInstructor
	ADD CONSTRAINT FK_CURSO_INSTRUCTOR_CURSOID
		FOREIGN KEY (CursoId) REFERENCES Curso(CursoId)

ALTER TABLE CursoInstructor
	ADD CONSTRAINT FK_CURSO_INSTRUCTOR_INSTRUCTORID
		FOREIGN KEY (InstructorId) REFERENCES Instructor(InstructorId)

INSERT INTO Curso
VALUES ('React Hooks, Firebase y Material Design', 'Curso de programaci�n en React', '2020-02-05', null)
go

INSERT INTO Curso
VALUES ('ASP NET Core y React Hooks', 'Curso de .NET y Javascript', '2020-11-05', null)
go

INSERT INTO Precio
VALUES (900, 9.99, 1)
go

INSERT INTO Precio
VALUES (650, 15.00, 2)
go

INSERT INTO Comentario
VALUES ('Alberto Rosales', 5, 'Es el mejor curso de React', 1)
go

INSERT INTO Comentario
VALUES ('Roman Albeiro', 5, 'Curso excelente de programacion', 1)
go

INSERT INTO Comentario
VALUES ('Angela Arias', 4, 'Laboratorios muy practicos', 1)
go

INSERT INTO Comentario
VALUES ('Fabian Drez', 5, 'Buen curso de ASP NET Core', 2)
go

INSERT INTO Comentario
VALUES ('Felipe Venegas', 5, 'SQL Server al maximo', 2)
go

INSERT INTO Instructor
VALUES ('Vaxi', 'Drez', 'Master', null)
go

INSERT INTO Instructor
VALUES ('Nestor', 'Arcila', 'Ingeniero', null)
go

INSERT INTO Instructor
VALUES ('John', 'Ortiz', 'Tecnico', null)
go

INSERT INTO Instructor
VALUES ('Angela', 'Arias', 'Ingeniero', null)
go

INSERT INTO CursoInstructor
VALUES (1, 1)
go

INSERT INTO CursoInstructor
VALUES (1, 2)
go

INSERT INTO CursoInstructor
VALUES (1, 3)
go

INSERT INTO CursoInstructor
VALUES (2, 1)
go

INSERT INTO CursoInstructor
VALUES (2, 4)
go

SELECT * FROM Curso
go

SELECT * FROM Precio
go

SELECT * FROM Comentario
go

SELECT * FROM Instructor
go

SELECT * FROM CursoInstructor
go

/*
USE master
go

DROP DATABASE dbCursosOnline
go
*/