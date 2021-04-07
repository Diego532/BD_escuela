use escuela 

--Tabla Carrera
create table carrera(
	NRC_C int,
	nombre_C varchar(30),
	duracion_C float,
	constraint pk_cc primary key(NRC_C)
)

insert into carrera values(
    1,'Ingenieria informatica',3
)

insert into carrera values(
    2, 'Arquitectura', 4
)

insert into carrera values(
	3,'Medicina',5
)

insert into carrera values (
	4,'Contaduria',5
)


--Tabla Materia
create Table materia(
	id_M int,
	nombre_M varchar(30),
	creditos_M float,
	constraint pk_cm primary key(id_M)
)

insert into materia values (
    1,'Bases de datos 1', 8
)

insert into materia values (
    2,'Calculo numerico',7
)

--Tabla Profesor
create Table profesor(
	id_Prof int,
	nombre_prof varchar(120),
	direccion varchar(200),
	telefono bigint,
	horario varchar(30)
	constraint pk_cp primary key(id_Prof)
)


insert into profesor values(1,'Happy henry','el cafetal',04248563578,'9:00am')
insert into profesor values(2,'Liliana lupo','barcelona',04148569548,'7:00am')


/* Tabla alumno 
    (con una clave foranea)*/

create Table alumno(
    id_alumno int,
    nombre_alumno varchar(120),
    edad_alumno int,
    semestre_alumno int,
    genero_alumno varchar(20),
    NRC_C1 int,
    constraint pk_calumno primary key(id_alumno),
    constraint fk_cC1 foreign key(NRC_C1) references carrera(NRC_C)
)

insert into alumno values (1,'Diego',20,6,'Masculino',1)
insert into alumno values (2,'Kamila',18,2,'Femenino',4)

-- Alumno-Profesor
create Table alumno_profesor(
    id_alumno1 int,
    id_Prof1 int,
    constraint pk_calumno1 foreign key( id_alumno1) references alumno(id_alumno),
    constraint pk_prof1 foreign key(id_Prof1) references profesor(id_Prof) 

)

insert into alumno_profesor values (2,1)




-- Alumno-Materia 
create table alumno_materia(
    id_alumno2 int,
    id_M1 int,
    constraint pk_calumno2 foreign key(id_alumno2) references alumno(id_alumno),
    constraint pk_cm1 foreign key(id_M1) references materia(id_M)
)

insert into alumno_materia values (1,1)

-- Profesor-Materia
create table profesor_materia(
    id_Prof2 int,
    id_M2 int,
    constraint pk_cprof2 foreign key(id_Prof2) references profesor(id_Prof),
    constraint pk_cid_M2 foreign key(id_M2) references materia(id_M)

)

insert into profesor_materia values (1,2)

-- mostrar un dato que se encuentre en una relacion pero en una entidad diferente, en este caso el nombre de la carrera
-- que cursan los alumnos de la tabla de alumno

select nombre_alumno,semestre_alumno,nombre_C from alumno inner join carrera on alumno.NRC_C1 = carrera.NRC_C

--mostrar el profesor que esta dictando la clase 
select nombre_alumno,semestre_alumno,nombre_C,nombre_prof from alumno inner join carrera on alumno.NRC_C1 = carrera.NRC_C
inner join alumno_profesor on alumno_profesor.id_alumno1 = alumno.id_alumno 
inner join profesor on profesor.id_Prof = alumno_profesor.id_Prof1

-- mostrar filtrar las personas que tienen una edad especifica
select * from alumno where edad_alumno = 18