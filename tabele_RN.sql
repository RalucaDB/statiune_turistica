create extension postgis;

create table if not exists obiective_turistice
(
	fid serial primary key,
	nume varchar(30) not null,
	tip varchar(20) not null,
	geom geometry(Point, 4326)
);

create table if not exists magazine
(
	fid serial primary key,
	orar_starttime time not null,
	orar_endtime time not null,
	geom geometry(Point, 4326)
);

create table if not exists parcari
(
	fid serial primary key,
	denumire varchar(50) not null,
	adresa varchar(100) not null,
	locuri_parcare integer not null,
	geom geometry(Polygon, 4326)
);

select * from magazine