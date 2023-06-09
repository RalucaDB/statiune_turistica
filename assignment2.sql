create extension postgis;
create table unitati_cazare
(
	fid SERIAL PRIMARY KEY,
	denumire VARCHAR(50) NOT NULL,
	servicii_masa VARCHAR(50),
	categorie VARCHAR(50) NOT NULL,
	grad_comfort VARCHAR(50) NOT NULL,
	capacitate_cazare int,
	servicii_disponibile VARCHAR(200),
	contact VARCHAR(15) NOT NULL,
	adresa VARCHAR(50),
	geom GEOMETRY(POLYGON, 4326) 
);

alter table unitati_cazare 
add column statiune_id INTEGER NOT NULL;
alter table unitati_cazare 
add constraint unitati_cazare_statiune
foreign key (statiune_id) references statiune(fid);

alter table restaurant
add statiune_id INTEGER NOT NULL;
alter table unitati_cazare 
add constraint restaurant_statiune
foreign key (statiune_id) references statiune (fid);


create table camere
(
	fid SERIAL PRIMARY KEY,
	numar_persoane integer NOT NULL,
	unitate_cazare_fid integer NOT NULL,
	vedere VARCHAR(50),
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	FOREIGN KEY(unitate_cazare_fid) REFERENCES unitati_cazare(fid)
);

create table if not exists meniu
(
	fid SERIAL PRIMARY KEY,
	restaurant_id integer NOT NULL,
	specific_bucatarie VARCHAR(50)
);

create table continut_meniu
( 
	optiuni_vegetariene VARCHAR(50),
	fel_principal VARCHAR(50),
	bauturi VARCHAR(50),
	pret DECIMAL NULL,
	meniu_id integer,
	foreign key(meniu_id) references meniu(fid)
	);

create table if not exists restaurant
(
	fid SERIAL PRIMARY KEY,
	denumire VARCHAR(50) NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	loc_servire VARCHAR(2),
	organizare_evenimente VARCHAR(2),
	locuri_parcare VARCHAR(2),
	contact VARCHAR(15),
	adresa VARCHAR(50),
	meniu_id integer NOT NULL,
	geom GEOMETRY(POINT, 4326) 
);

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
