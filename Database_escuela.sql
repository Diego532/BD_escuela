use escuela 

--Tabla Carrera
create table carrera(
	NRC_C int,
	nombre_C varchar(30),
	duracion_C float,
	constraint pk_cc primary key(NRC_C)
)

--Tabla Materia
create Table materia(
	id_M int,
	nombre_M varchar(30),
	creditos_M float,
	constraint pk_cm primary key(id_M)
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

-- Alumno-Profesor
create Table alumno_profesor(
    id_alumno1 int,
    id_Prof1 int,
    constraint pk_calumno1 foreign key( id_alumno1) references alumno(id_alumno),
    constraint pk_prof1 foreign key(id_Prof1) references profesor(id_Prof) 

)

-- Alumno-Materia 
create table alumno_materia(
    id_alumno2 int,
    id_M1 int,
    constraint pk_calumno2 foreign key(id_alumno2) references alumno(id_alumno),
    constraint pk_cm1 foreign key(id_M1) references materia(id_M)
)

-- Profesor-Materia
create table profesor_materia(
    id_Prof2 int,
    id_M2 int,
    constraint pk_cprof2 foreign key(id_Prof2) references profesor(id_Prof),
    constraint pk_cid_M2 foreign key(id_M2) references materia(id_M)

)