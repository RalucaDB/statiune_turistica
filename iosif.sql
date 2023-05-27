create extension postgis;
create table spitale
(
	fid SERIAL PRIMARY KEY,
	denumire VARCHAR(50) NOT NULL,
	adresa VARCHAR(100) NOT NULL,
	statiune_id INTEGER NOT NULL,
	geom GEOMETRY(POLYGON, 4326),
	foreign key (statiune_id) references statiune (fid)
	);
	

create table if not exists statiune
(
	fid SERIAL PRIMARY KEY,
	denumire VARCHAR(50) NOT NULL,
	geom GEOMETRY(POLYGON, 4326)
	);
	
create table farmacii
(
fid SERIAL PRIMARY KEY,
denumire VARCHAR(50) NOT NULL,
adresa VARCHAR(100) NOT NULL,
orar VARCHAR(50) NOT NULL,
geom GEOMETRY(POLYGON, 4326),
statiune_id INTEGER NOT NULL,
foreign key (statiune_id) references statiune (fid)	
);