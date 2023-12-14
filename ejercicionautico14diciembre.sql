create table personas
(
dni char(9) primary key,
nombre_p varchar(60) not null,
direction varchar (120)
);

create table socios
(
carnet char(10),
dni char (9)primary key,
constraint FK_socios_personas foreign key (dni) references personas (dni)	
);

create table patrones
(
licencia char(10),
dni char (9)primary key,
constraint FK_patrones_personas foreign key (dni) references personas (dni)	
);

create table barcos
(
    matricula char(7) primary key,
	nombre_b varchar (60) not null,
	amare integer ,
	cuota money,
	dni char (9) ,
	constraint FK_barcos_socios foreign key (dni) references socios (dni)
);

create table salidas
(
dni char (9),
matricula char(7),
fecha_salida date,
h_salida integer,
destino varchar (60),
constraint PK_salidas primary key (dni,matricula),
constraint FK_salidas_barcos foreign key (matricula )references barcos(matricula),
constraint Fk_salidas_patrones foreign key (dni) references patrones(dni)
);

