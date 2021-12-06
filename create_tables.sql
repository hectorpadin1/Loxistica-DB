/**

 			SCRIPT PARA A CREACIÓN DA BASE DE DATOS


 Opción 2: Loxística
 Autor: Héctor Padín Torrente (hector.padin@udc.es)
 Grupo: 1.4
 
*/

drop table pasapor purge;
drop table descarga purge;
drop table viaxe purge;
drop table conten purge;
drop table entrega purge;
drop table lineacompra purge;
drop table compra purge;
drop table lineasolicitude purge;
drop table solicitude purge;
drop table voo purge;
drop table ruta purge;
drop table camion purge;
drop table conductor purge;
drop table producto purge;
drop table provedor purge;
drop table centrodistr purge;
drop table centro purge;
drop table comunidade purge;

/**

					CREACIÓN DAS TÁBOAS

*******************************************************************************************************

*/

CREATE TABLE comunidade (
	idc NUMERIC(4),
	nome VARCHAR(15) CONSTRAINT NN_comunidade_nome NOT NULL,
	CONSTRAINT PK_comunidade PRIMARY KEY (idc)
);

CREATE TABLE centro (
	idcen NUMERIC(6),
	nomec VARCHAR(30) CONSTRAINT NN_centro_nomec NOT NULL,
	idc NUMERIC(4),
	CONSTRAINT PK_centro PRIMARY KEY (idcen)
);

CREATE TABLE centrodistr (
	idcdis NUMERIC(4),
	nomedis VARCHAR(40) CONSTRAINT NN_centrodistr_nomedis NOT NULL,
	idc NUMERIC(4),
	CONSTRAINT PK_centrodistr PRIMARY KEY (idcdis)
);

CREATE TABLE provedor (
	cprovedor NUMERIC(4),
	nomeprov VARCHAR(20) CONSTRAINT NN_provedor_nomeprov NOT NULL,
	CONSTRAINT PK_provedor PRIMARY KEY (cprovedor)
);

CREATE TABLE producto (
	cproducto NUMERIC(4),
	nomep VARCHAR(20) CONSTRAINT NN_producto_nomep NOT NULL,
	CONSTRAINT PK_producto PRIMARY KEY (cproducto)
);

CREATE TABLE voo (
	cvoo NUMERIC(6),
	lsaida VARCHAR(15) CONSTRAINT NN_voo_lsaida NOT NULL,
	lchegada VARCHAR(15) CONSTRAINT NN_voo_lchegada NOT NULL,
	hsaida DATE CONSTRAINT NN_voo_hsaida NOT NULL,
	hchegada DATE,
	CONSTRAINT PK_voo PRIMARY KEY (cvoo)
);

CREATE TABLE conductor (
	carnet NUMERIC(8),
	nomecond VARCHAR(40) CONSTRAINT NN_conductor_nomecond NOT NULL,
	CONSTRAINT PK_conductor PRIMARY KEY (carnet)
);

CREATE TABLE camion (
	matricula VARCHAR(7),
	marca VARCHAR(15) CONSTRAINT NN_camion_marca NOT NULL,
	CONSTRAINT PK_camion PRIMARY KEY (matricula)
);

CREATE TABLE ruta (
	cruta NUMERIC(4),
	nomeruta VARCHAR(15) CONSTRAINT NN_ruta_nomeruta NOT NULL,
	CONSTRAINT PK_ruta PRIMARY KEY (cruta)
);

CREATE TABLE compra (
	ccompra NUMERIC(6),
	dcompra DATE CONSTRAINT NN_compra_dcompra NOT NULL,
	idc NUMERIC(4),
	cprovedor NUMERIC(4),
	CONSTRAINT PK_compra PRIMARY KEY (ccompra)
);

CREATE TABLE lineacompra (
	ccompra NUMERIC(6),
	nlineac NUMERIC(4),
	cproducto NUMERIC(4),
	ccomprada NUMERIC(10) CONSTRAINT NN_lineacompra_ccomprada NOT NULL,
	CONSTRAINT PK_lineacompra PRIMARY KEY (ccompra,nlineac)
);

CREATE TABLE solicitude (
	npeticion NUMERIC(6),
	dpeticion DATE CONSTRAINT NN_solicitude_dpeticion NOT NULL,
	idcen NUMERIC(6),
	CONSTRAINT PK_solicitude PRIMARY KEY (npeticion)
);

CREATE TABLE lineasolicitude (
	npeticion NUMERIC(6),
	nlineas NUMERIC(4),
	cproducto NUMERIC(4),
	csolicitada NUMERIC(10) CONSTRAINT NN_lineasolicitude_csolicitada NOT NULL,
	CONSTRAINT PK_lineasolicitude PRIMARY KEY (npeticion,nlineas)
);

CREATE TABLE entrega (
	idc NUMERIC(4),
	centrega NUMERIC(6),
	dentrega DATE,
	cvoo NUMERIC(6),
	CONSTRAINT PK_entrega PRIMARY KEY (idc,centrega)
);

CREATE TABLE conten (
	ccompra NUMERIC(6),
	nlineac NUMERIC(4),
	idc NUMERIC(4),
	centrega NUMERIC(6),
	CONSTRAINT PK_conten PRIMARY KEY (ccompra,nlineac,idc,centrega)
);

CREATE TABLE viaxe (
	cruta NUMERIC(4),
	horasaida DATE,
	horachegada DATE,
	matricula VARCHAR(8),
	carnet NUMERIC(8),
	CONSTRAINT PK_viaxe PRIMARY KEY (cruta,horasaida)
);

CREATE TABLE descarga (
	cruta NUMERIC(4),
	horasaida DATE,
	ccompra NUMERIC(6),
	nlineac NUMERIC(4),
	cvoo NUMERIC(6),
	ctransportada NUMERIC(10) CONSTRAINT NN_descarga_ctransportada NOT NULL,
	CONSTRAINT PK_descarga PRIMARY KEY (cruta,horasaida,ccompra,nlineac)
);

CREATE TABLE pasapor (
	cruta NUMERIC(4),
	horasaida DATE,
	ccompra NUMERIC(6),
	nlineac NUMERIC(4),
	idcdis NUMERIC(4),
	hparada DATE CONSTRAINT NN_pasapor_hparada NOT NULL,
	casignada NUMERIC(10) CONSTRAINT NN_pasapor_casignada NOT NULL,
	CONSTRAINT PK_pasapor PRIMARY KEY (cruta,horasaida,ccompra,nlineac)
);





/**

						CONTENIDO DAS TÁBOAS

*******************************************************************************************************

*/

INSERT INTO comunidade (idc, nome) VALUES (0000,'Galicia'); 
INSERT INTO comunidade (idc, nome) VALUES (0001,'Asturias');
INSERT INTO comunidade (idc, nome) VALUES (0002,'Castilla y Leon');

INSERT INTO centro (idcen, nomec, idc) VALUES (000000,'Arquitecto Marcide',0000);
INSERT INTO centro (idcen, nomec, idc) VALUES (000001,'Hospital Naval',0000);
INSERT INTO centro (idcen, nomec, idc) VALUES (000002,'Hospital Modelo',0000);
INSERT INTO centro (idcen, nomec, idc) VALUES (000003,'Hospital de Oviedo',0001);
INSERT INTO centro (idcen, nomec, idc) VALUES (000004,'Hospital de la Cruz Roja',0001);
INSERT INTO centro (idcen, nomec, idc) VALUES (000005,'Hospital Central Asturiano',0001);
INSERT INTO centro (idcen, nomec, idc) VALUES (000006,'Hospital Leonés',0002);
INSERT INTO centro (idcen, nomec, idc) VALUES (000007,'Hospital Santa Isabel',0002);
INSERT INTO centro (idcen, nomec, idc) VALUES (000008,'Hospital San Andrés',0002);


INSERT INTO centrodistr (idcdis, nomedis, idc) VALUES (0000,'CDMSG',0000);
INSERT INTO centrodistr (idcdis, nomedis, idc) VALUES (0001,'Centro de Distribucion Asturiano',0001);
INSERT INTO centrodistr (idcdis, nomedis, idc) VALUES (0002,'CDMSCL',0002);


INSERT INTO provedor (cprovedor, nomeprov) VALUES (0000,'Queralto');
INSERT INTO provedor (cprovedor, nomeprov) VALUES (0001,'Quirumed');
INSERT INTO provedor (cprovedor, nomeprov) VALUES (0002,'Parafarmic');
INSERT INTO provedor (cprovedor, nomeprov) VALUES (0003,'Sanycare');
INSERT INTO provedor (cprovedor, nomeprov) VALUES (0004,'Prosaga');


INSERT INTO producto (cproducto, nomep) VALUES (0000,'Mascarilla');
INSERT INTO producto (cproducto, nomep) VALUES (0001,'Inhalador');
INSERT INTO producto (cproducto, nomep) VALUES (0002,'Desinfectante');
INSERT INTO producto (cproducto, nomep) VALUES (0003,'Betadine');
INSERT INTO producto (cproducto, nomep) VALUES (0004,'Ibuprofeno');
INSERT INTO producto (cproducto, nomep) VALUES (0005,'Frenadol');
INSERT INTO producto (cproducto, nomep) VALUES (0006,'Guantes');
INSERT INTO producto (cproducto, nomep) VALUES (0007,'Termómetro');


INSERT INTO conductor (carnet, nomecond) VALUES (79345628,'Javier Gómez Rial');
INSERT INTO conductor (carnet, nomecond) VALUES (82638476,'Esther García López');
INSERT INTO conductor (carnet, nomecond) VALUES (35465273,'Paula Raposo López');
INSERT INTO conductor (carnet, nomecond) VALUES (63848283,'Jorge Souto Fuentes');
INSERT INTO conductor (carnet, nomecond) VALUES (46574783,'Daniel Ferreiro Villamor');


INSERT INTO camion (matricula, marca) VALUES ('8273BRZ','Mercedes');
INSERT INTO camion (matricula, marca) VALUES ('6473GFT','Iveco');
INSERT INTO camion (matricula, marca) VALUES ('7465HJS','Volvo');
INSERT INTO camion (matricula, marca) VALUES ('3746KLS','Iveco');
INSERT INTO camion (matricula, marca) VALUES ('7364FHK','JAC');


INSERT INTO ruta (cruta, nomeruta) VALUES (0000,'G');
INSERT INTO ruta (cruta, nomeruta) VALUES (0001,'G-A');
INSERT INTO ruta (cruta, nomeruta) VALUES (0002,'G-CL');
INSERT INTO ruta (cruta, nomeruta) VALUES (0003,'A');
INSERT INTO ruta (cruta, nomeruta) VALUES (0004,'A-CL');
INSERT INTO ruta (cruta, nomeruta) VALUES (0005,'G-A-CL');
INSERT INTO ruta (cruta, nomeruta) VALUES (0006,'CL');


INSERT INTO voo (cvoo, lsaida, lchegada, hsaida, hchegada) VALUES (000000,'Madrid','Coruña',to_date('22/02/2020 23:45:00','DD/MM/YYYY HH24:MI:SS'),to_date('22/02/2020 01:15:00','DD/MM/YYYY HH24:MI:SS'));
INSERT INTO voo (cvoo, lsaida, lchegada, hsaida, hchegada) VALUES (000001,'Madrid','Leon',to_date('25/03/2020 12:00:00','DD/MM/YYYY HH24:MI:SS'),to_date('25/03/2020 13:15:00','DD/MM/YYYY HH24:MI:SS'));
INSERT INTO voo (cvoo, lsaida, lchegada, hsaida, hchegada) VALUES (000002,'Madrid','Oviedo',to_date('10/04/2020 16:30:00','DD/MM/YYYY HH24:MI:SS'),to_date('10/04/2020 18:30:00','DD/MM/YYYY HH24:MI:SS'));
INSERT INTO voo (cvoo, lsaida, lchegada, hsaida, hchegada) VALUES (000003,'Madrid','Santiago',to_date('01/05/2020 01:30:00','DD/MM/YYYY HH24:MI:SS'),to_date('01/05/2020 02:45:00','DD/MM/YYYY HH24:MI:SS'));


INSERT INTO solicitude (npeticion, dpeticion, idcen) VALUES (000000,to_date('17/02/2020','DD/MM/YYYY'),000000);
INSERT INTO solicitude (npeticion, dpeticion, idcen) VALUES (000001,to_date('09/03/2020','DD/MM/YYYY'),000001);
INSERT INTO solicitude (npeticion, dpeticion, idcen) VALUES (000002,to_date('20/03/2020','DD/MM/YYYY'),000002);
INSERT INTO solicitude (npeticion, dpeticion, idcen) VALUES (000003,to_date('06/04/2020','DD/MM/YYYY'),000000);
INSERT INTO solicitude (npeticion, dpeticion, idcen) VALUES (000004,to_date('10/02/2020','DD/MM/YYYY'),000005);
INSERT INTO solicitude (npeticion, dpeticion, idcen) VALUES (000005,to_date('27/03/2020','DD/MM/YYYY'),000003);
INSERT INTO solicitude (npeticion, dpeticion, idcen) VALUES (000006,to_date('08/04/2020','DD/MM/YYYY'),000004);
INSERT INTO solicitude (npeticion, dpeticion, idcen) VALUES (000007,to_date('27/04/2020','DD/MM/YYYY'),000004);
INSERT INTO solicitude (npeticion, dpeticion, idcen) VALUES (000008,to_date('09/02/2020','DD/MM/YYYY'),000006);
INSERT INTO solicitude (npeticion, dpeticion, idcen) VALUES (000009,to_date('15/03/2020','DD/MM/YYYY'),000006);
INSERT INTO solicitude (npeticion, dpeticion, idcen) VALUES (000010,to_date('01/04/2020','DD/MM/YYYY'),000008);
INSERT INTO solicitude (npeticion, dpeticion, idcen) VALUES (000011,to_date('25/04/2020','DD/MM/YYYY'),000008);


INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000000,0000,0000,1100);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000000,0001,0006,2500);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000001,0000,0000,4000);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000002,0000,0000,1200);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000002,0001,0007,1000);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000002,0002,0002,3500);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000003,0000,0000,5300);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000004,0000,0005,200);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000004,0001,0003,200);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000004,0002,0004,600);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000005,0000,0002,1500);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000005,0001,0006,3000);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000006,0000,0002,2000);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000006,0001,0000,2000);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000007,0000,0007,1000);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000008,0000,0000,15000);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000009,0000,0002,2000);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000009,0001,0007,1100);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000009,0002,0006,7000);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000010,0000,0004,5000);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000010,0001,0005,1500);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000011,0000,0000,2300);
INSERT INTO lineasolicitude (npeticion, nlineas, cproducto, csolicitada) VALUES (000011,0001,0006,2000);


INSERT INTO compra (ccompra, dcompra, idc, cprovedor) VALUES (000000,to_date('20/02/2020','DD/MM/YYYY'),0000,0001);
INSERT INTO compra (ccompra, dcompra, idc, cprovedor) VALUES (000001,to_date('11/03/2020','DD/MM/YYYY'),0000,0001);
INSERT INTO compra (ccompra, dcompra, idc, cprovedor) VALUES (000002,to_date('23/03/2020','DD/MM/YYYY'),0000,0000);
INSERT INTO compra (ccompra, dcompra, idc, cprovedor) VALUES (000003,to_date('07/04/2020','DD/MM/YYYY'),0000,0003);
INSERT INTO compra (ccompra, dcompra, idc, cprovedor) VALUES (000004,to_date('15/02/2020','DD/MM/YYYY'),0001,0004);
INSERT INTO compra (ccompra, dcompra, idc, cprovedor) VALUES (000005,to_date('01/04/2020','DD/MM/YYYY'),0001,0001);
INSERT INTO compra (ccompra, dcompra, idc, cprovedor) VALUES (000006,to_date('09/04/2020','DD/MM/YYYY'),0001,0000);
INSERT INTO compra (ccompra, dcompra, idc, cprovedor) VALUES (000007,to_date('29/04/2020','DD/MM/YYYY'),0001,0000);
INSERT INTO compra (ccompra, dcompra, idc, cprovedor) VALUES (000008,to_date('12/02/2020','DD/MM/YYYY'),0002,0000);
INSERT INTO compra (ccompra, dcompra, idc, cprovedor) VALUES (000009,to_date('20/03/2020','DD/MM/YYYY'),0002,0001);
INSERT INTO compra (ccompra, dcompra, idc, cprovedor) VALUES (000010,to_date('02/04/2020','DD/MM/YYYY'),0002,0001);
INSERT INTO compra (ccompra, dcompra, idc, cprovedor) VALUES (000011,to_date('28/04/2020','DD/MM/YYYY'),0002,0004);


INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000000,0000,0000,1000);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000000,0001,0006,2000);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000001,0000,0000,4000);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000002,0000,0000,1000);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000002,0001,0007,500);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000002,0002,0002,3000);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000003,0000,0000,5000);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000004,0000,0005,200);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000004,0001,0003,100);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000004,0002,0004,500);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000005,0000,0002,1000);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000005,0001,0006,2000);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000006,0000,0002,2000);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000006,0001,0000,1000);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000007,0000,0007,1000);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000008,0000,0000,10000);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000009,0000,0002,2000);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000009,0001,0007,1000);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000009,0002,0006,5000);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000010,0000,0004,4000);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000010,0001,0005,1000);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000011,0000,0000,2000);
INSERT INTO lineacompra (ccompra, nlineac, cproducto, ccomprada) VALUES (000011,0001,0006,1000);


INSERT INTO entrega (idc, centrega, dentrega, cvoo) VALUES (0000,000000,to_date('24/02/2020','DD/MM/YYYY'),000000);
INSERT INTO entrega (idc, centrega, dentrega, cvoo) VALUES (0000,000001,to_date('27/03/2020','DD/MM/YYYY'),000001);
INSERT INTO entrega (idc, centrega, dentrega, cvoo) VALUES (0000,000002,to_date('27/03/2020','DD/MM/YYYY'),000001);
INSERT INTO entrega (idc, centrega, dentrega, cvoo) VALUES (0000,000003,to_date('27/03/2020','DD/MM/YYYY'),000001);
INSERT INTO entrega (idc, centrega, dentrega, cvoo) VALUES (0000,000004,to_date('27/03/2020','DD/MM/YYYY'),000001);
INSERT INTO entrega (idc, centrega, dentrega, cvoo) VALUES (0000,000005,to_date('12/04/2020','DD/MM/YYYY'),000002);
INSERT INTO entrega (idc, centrega, dentrega, cvoo) VALUES (0001,000006,to_date('24/02/2020','DD/MM/YYYY'),000000);
INSERT INTO entrega (idc, centrega, dentrega, cvoo) VALUES (0001,000007,to_date('12/04/2020','DD/MM/YYYY'),000002);
INSERT INTO entrega (idc, centrega, dentrega, cvoo) VALUES (0001,000008,to_date('12/04/2020','DD/MM/YYYY'),000002);
INSERT INTO entrega (idc, centrega, dentrega, cvoo) VALUES (0001,000009,to_date('30/04/2020','DD/MM/YYYY'),000003);
INSERT INTO entrega (idc, centrega, dentrega, cvoo) VALUES (0002,000010,to_date('24/02/2020','DD/MM/YYYY'),000000);
INSERT INTO entrega (idc, centrega, dentrega, cvoo) VALUES (0002,000011,to_date('24/02/2020','DD/MM/YYYY'),000000);
INSERT INTO entrega (idc, centrega, dentrega, cvoo) VALUES (0002,000012,to_date('27/03/2020','DD/MM/YYYY'),000001);
INSERT INTO entrega (idc, centrega, dentrega, cvoo) VALUES (0002,000013,to_date('27/03/2020','DD/MM/YYYY'),000001);
INSERT INTO entrega (idc, centrega, dentrega, cvoo) VALUES (0002,000014,to_date('12/04/2020','DD/MM/YYYY'),000002);
INSERT INTO entrega (idc, centrega, dentrega, cvoo) VALUES (0002,000015,to_date('30/04/2020','DD/MM/YYYY'),000003);
INSERT INTO entrega (idc, centrega, dentrega, cvoo) VALUES (0002,000016,to_date('03/05/2020','DD/MM/YYYY'),000003);


INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000000,0000,0000,000000);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000000,0001,0000,000000);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000001,0000,0000,000001);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000001,0000,0000,000002);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000002,0000,0000,000003);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000002,0001,0000,000003);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000002,0002,0000,000004);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000003,0000,0000,000005);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000004,0000,0001,000006);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000004,0001,0001,000006);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000004,0002,0001,000006);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000005,0000,0001,000007);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000005,0001,0001,000007);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000006,0000,0001,000008);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000006,0001,0001,000008);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000007,0000,0001,000009);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000008,0000,0002,000010);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000008,0000,0002,000011);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000009,0000,0002,000012);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000009,0001,0002,000012);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000009,0002,0002,000013);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000010,0000,0002,000014);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000010,0001,0002,000014);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000011,0000,0002,000015);
INSERT INTO conten (ccompra, nlineac, idc, centrega) VALUES (000011,0001,0002,000016);


INSERT INTO viaxe (cruta, horasaida, horachegada, matricula, carnet) VALUES (0001,to_date('22/02/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),to_date('22/02/2020 20:36:12','DD/MM/YYYY HH24:MI:SS'),'7364FHK',79345628);
INSERT INTO viaxe (cruta, horasaida, horachegada, matricula, carnet) VALUES (0006,to_date('22/02/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),to_date('22/02/2020 14:30:58','DD/MM/YYYY HH24:MI:SS'),'8273BRZ',35465273);
INSERT INTO viaxe (cruta, horasaida, horachegada, matricula, carnet) VALUES (0002,to_date('26/03/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),to_date('26/03/2020 22:24:23','DD/MM/YYYY HH24:MI:SS'),'7364FHK',63848283);
INSERT INTO viaxe (cruta, horasaida, horachegada, matricula, carnet) VALUES (0005,to_date('11/04/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),to_date('12/04/2020 02:23:40','DD/MM/YYYY HH24:MI:SS'),'7465HJS',46574783);
INSERT INTO viaxe (cruta, horasaida, horachegada, matricula, carnet) VALUES (0004,to_date('01/05/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),to_date('01/05/2020 15:24:52','DD/MM/YYYY HH24:MI:SS'),'6473GFT',63848283);


INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0001,to_date('22/02/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000000,0000,000000,1000);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0001,to_date('22/02/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000000,0001,000000,2000);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0001,to_date('22/02/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000006,0000,000000,2000);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0001,to_date('22/02/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000006,0001,000000,1000);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0006,to_date('22/02/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000008,0000,000000,10000);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0002,to_date('26/03/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000001,0000,000001,4000);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0002,to_date('26/03/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000002,0000,000001,1000);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0002,to_date('26/03/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000002,0001,000001,500);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0002,to_date('26/03/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000002,0002,000001,3000);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0002,to_date('26/03/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000009,0000,000001,2000);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0002,to_date('26/03/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000009,0001,000001,1000);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0002,to_date('26/03/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000009,0002,000001,5000);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0005,to_date('11/04/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000003,0000,000002,5000);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0005,to_date('11/04/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000005,0000,000002,1000);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0005,to_date('11/04/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000005,0001,000002,2000);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0005,to_date('11/04/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000006,0000,000002,2000);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0005,to_date('11/04/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000006,0001,000002,1000);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0005,to_date('11/04/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000010,0000,000002,5000);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0005,to_date('11/04/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000010,0001,000002,1500);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0004,to_date('01/05/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000007,0000,000003,1000);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0004,to_date('01/05/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000011,0000,000003,2000);
INSERT INTO descarga (cruta, horasaida, ccompra, nlineac, cvoo, ctransportada) VALUES (0004,to_date('01/05/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000011,0001,000003,1000);


INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0001,to_date('22/02/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000000,0000,0000,to_date('22/02/2020 08:34:23','DD/MM/YYYY HH24:MI:SS'),1000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0001,to_date('22/02/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000000,0001,0000,to_date('22/02/2020 09:10:12','DD/MM/YYYY HH24:MI:SS'),2000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0001,to_date('22/02/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000006,0000,0001,to_date('22/02/2020 12:54:41','DD/MM/YYYY HH24:MI:SS'),2000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0001,to_date('22/02/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000006,0001,0001,to_date('22/02/2020 15:34:25','DD/MM/YYYY HH24:MI:SS'),1000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0006,to_date('22/02/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000008,0000,0002,to_date('22/02/2020 16:23:54','DD/MM/YYYY HH24:MI:SS'),10000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0002,to_date('26/03/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000001,0000,0000,to_date('26/03/2020 06:56:30','DD/MM/YYYY HH24:MI:SS'),4000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0002,to_date('26/03/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000002,0000,0000,to_date('26/03/2020 10:23:25','DD/MM/YYYY HH24:MI:SS'),1000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0002,to_date('26/03/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000002,0001,0000,to_date('26/03/2020 13:24:24','DD/MM/YYYY HH24:MI:SS'),500);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0002,to_date('26/03/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000002,0002,0000,to_date('26/03/2020 15:24:24','DD/MM/YYYY HH24:MI:SS'),3000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0002,to_date('26/03/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000009,0000,0002,to_date('26/03/2020 16:23:15','DD/MM/YYYY HH24:MI:SS'),2000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0002,to_date('26/03/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000009,0001,0002,to_date('26/03/2020 17:01:52','DD/MM/YYYY HH24:MI:SS'),1000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0002,to_date('26/03/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000009,0002,0002,to_date('26/03/2020 18:16:23','DD/MM/YYYY HH24:MI:SS'),5000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0005,to_date('11/04/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000003,0000,0000,to_date('11/04/2020 07:12:03','DD/MM/YYYY HH24:MI:SS'),5000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0005,to_date('11/04/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000005,0000,0001,to_date('11/04/2020 11:41:29','DD/MM/YYYY HH24:MI:SS'),1000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0005,to_date('11/04/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000005,0001,0001,to_date('11/04/2020 14:53:12','DD/MM/YYYY HH24:MI:SS'),2000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0005,to_date('11/04/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000006,0000,0001,to_date('11/04/2020 17:52:43','DD/MM/YYYY HH24:MI:SS'),2000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0005,to_date('11/04/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000006,0001,0001,to_date('11/04/2020 20:14:42','DD/MM/YYYY HH24:MI:SS'),1000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0005,to_date('11/04/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000010,0000,0002,to_date('11/04/2020 22:39:13','DD/MM/YYYY HH24:MI:SS'),4000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0005,to_date('11/04/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000010,0001,0002,to_date('11/04/2020 23:05:12','DD/MM/YYYY HH24:MI:SS'),1000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0004,to_date('01/05/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000007,0000,0001,to_date('01/05/2020 06:23:51','DD/MM/YYYY HH24:MI:SS'),1000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0004,to_date('01/05/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000011,0000,0002,to_date('01/05/2020 08:21:34','DD/MM/YYYY HH24:MI:SS'),2000);
INSERT INTO pasapor (cruta, horasaida, ccompra, nlineac, idcdis, hparada, casignada) VALUES (0004,to_date('01/05/2020 06:00:00','DD/MM/YYYY HH24:MI:SS'),000011,0001,0002,to_date('01/05/2020 09:10:52','DD/MM/YYYY HH24:MI:SS'),1000);


/**

						RESTRICCIÓNS DAS TÁBOAS

*******************************************************************************************************

*/

ALTER TABLE centro ADD CONSTRAINT FK_centro_idc FOREIGN KEY (idc) REFERENCES comunidade ON DELETE CASCADE;

ALTER TABLE centrodistr ADD CONSTRAINT FK_centrodistr_idc FOREIGN KEY (idc) REFERENCES comunidade ON DELETE CASCADE;

ALTER TABLE compra ADD CONSTRAINT FK_compra_idc FOREIGN KEY (idc) REFERENCES comunidade ON DELETE CASCADE;
ALTER TABLE compra ADD CONSTRAINT FK_compra_cprovedor FOREIGN KEY (cprovedor) REFERENCES provedor ON DELETE CASCADE;

ALTER TABLE lineacompra ADD CONSTRAINT FK_lineacompra_ccompra FOREIGN KEY (ccompra) REFERENCES compra ON DELETE CASCADE;
ALTER TABLE lineacompra ADD CONSTRAINT FK_lineacompra_cproducto FOREIGN KEY (cproducto) REFERENCES producto ON DELETE CASCADE;
ALTER TABLE lineacompra ADD CONSTRAINT CH_lineacompra_ccomprada CHECK (ccomprada>0);

ALTER TABLE solicitude ADD CONSTRAINT FK_solicitude_idcen FOREIGN KEY (idcen) REFERENCES centro ON DELETE CASCADE;

ALTER TABLE lineasolicitude ADD CONSTRAINT FK_lineasolicitude_npeticion FOREIGN KEY (npeticion) REFERENCES solicitude ON DELETE CASCADE;
ALTER TABLE lineasolicitude ADD CONSTRAINT FK_lineasolicitude_cproducto FOREIGN KEY (cproducto) REFERENCES producto ON DELETE CASCADE;
ALTER TABLE lineasolicitude ADD CONSTRAINT CH_lineasolicitude_csolicitada CHECK (csolicitada>0);

ALTER TABLE entrega ADD CONSTRAINT FK_entrega_idc FOREIGN KEY (idc) REFERENCES comunidade ON DELETE CASCADE;
ALTER TABLE entrega ADD CONSTRAINT FK_entrega_voo FOREIGN KEY (cvoo) REFERENCES voo ON DELETE CASCADE;

ALTER TABLE conten ADD CONSTRAINT FK_conten_nlineac FOREIGN KEY (ccompra,nlineac) REFERENCES lineacompra ON DELETE CASCADE;
ALTER TABLE conten ADD CONSTRAINT FK_conten_entrega FOREIGN KEY (idc,centrega) REFERENCES entrega ON DELETE CASCADE;

ALTER TABLE viaxe ADD CONSTRAINT FK_viaxe_cruta FOREIGN KEY (cruta) REFERENCES ruta ON DELETE CASCADE;
ALTER TABLE viaxe ADD CONSTRAINT FK_viaxe_matricula FOREIGN KEY (matricula) REFERENCES camion ON DELETE CASCADE;
ALTER TABLE viaxe ADD CONSTRAINT FK_viaxe_carnet FOREIGN KEY (carnet) REFERENCES conductor ON DELETE CASCADE;

ALTER TABLE descarga ADD CONSTRAINT FK_descarga_cvoo FOREIGN KEY (cvoo) REFERENCES voo ON DELETE CASCADE;
ALTER TABLE descarga ADD CONSTRAINT FK_descarga_viaxe FOREIGN KEY (cruta,horasaida) REFERENCES viaxe ON DELETE CASCADE;
ALTER TABLE descarga ADD CONSTRAINT FK_descarga_lcompra FOREIGN KEY (ccompra,nlineac) REFERENCES lineacompra ON DELETE CASCADE;
ALTER TABLE descarga ADD CONSTRAINT CH_descarga_ctransportada CHECK (ctransportada>0);

ALTER TABLE pasapor ADD CONSTRAINT FK_pasapor_centrodistr FOREIGN KEY (idcdis) REFERENCES centrodistr ON DELETE CASCADE;
ALTER TABLE pasapor ADD CONSTRAINT FK_pasapor_viaxe FOREIGN KEY (cruta,horasaida) REFERENCES viaxe ON DELETE CASCADE;
ALTER TABLE pasapor ADD CONSTRAINT FK_pasapor_lcompra FOREIGN KEY (ccompra,nlineac) REFERENCES lineacompra ON DELETE CASCADE;
ALTER TABLE pasapor ADD CONSTRAINT CH_casignada CHECK (casignada>0);








