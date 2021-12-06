/**

 				SCRIPT DE CONSULTAS


 Opción 2: Loxística
 Autor: Héctor Padín Torrente (hector.padin@udc.es)
 Grupo: 1.4
 
*/

/*

 Consultas SQL

*/

/* Consulta 1*/

select c.idc as "ID", c.nome as "Comunidade", cp.dcompra as "Data", p.cprovedor as "IDP", p.nomeprov as "Provedor"
from compra cp join comunidade c on cp.idc=c.idc join provedor p on cp.cprovedor=p.cprovedor
where cp.dcompra < '01/05/2020';

/* Consulta 2*/

select p.nomep as "Provedor", l.ccomprada as "Cantidade"
from lineacompra l join producto p on l.cproducto=p.cproducto
where l.ccompra=2

/* Consulta 3*/

select count(distinct centrega) as "Numero de entregas"
from conten
where ccompra=2

/* Consulta 4*/

select p.nomep "Producto", e.dentrega as "Data de entrega", l.ccomprada as "Cantidade a entregar"
from lineacompra l join producto p on l.cproducto=p.cproducto join conten c on l.ccompra=c.ccompra and l.nlineac=c.nlineac join entrega e on c.idc=e.idc and c.centrega=e.centrega
where l.ccompra=2

/* Consulta 5*/

select p.nomep "Producto", e.dentrega as "Data de entrega", l.ccomprada as "Cantidade a entregar", pp.casignada as "Cantidade entregada", l.ccomprada/pp.casignada*100 "%"
from lineacompra l join producto p on l.cproducto=p.cproducto join conten c on l.ccompra=c.ccompra and l.nlineac=c.nlineac join entrega e on c.idc=e.idc and c.centrega=e.centrega join pasapor pp on l.ccompra=pp.ccompra and l.nlineac=pp.nlineac
where l.ccompra=2

/* Consulta 6*/

select lsaida as "Localidade de orixe", lchegada as "Localidade de chegada", to_char(hsaida,'HH24:MM:SS') as "Hora de saída", to_char(hchegada,'HH24:MM:SS') as "Hora de chegada"
from voo
where to_char(hsaida,'DD/MM/YYYY')='01/05/2020'

/* Consulta 7*/

select p.nomep as "Producto", d.ctransportada as "Cantidade transportada"
from voo v join descarga d on v.cvoo=d.cvoo join lineacompra l on d.ccompra=l.ccompra and d.nlineac=l.nlineac join producto p on l.cproducto=p.cproducto
where to_char(v.hsaida,'DD/MM/YYYY')='01/05/2020'

/* Consulta 8*/

select p.nomep as "Producto", d.ctransportada as "Cantidade transportada", pr.cprovedor as "Provedor", c.idc "Comunidade"
from voo v join descarga d on v.cvoo=d.cvoo join lineacompra l on d.ccompra=l.ccompra and d.nlineac=l.nlineac join producto p on l.cproducto=p.cproducto join compra cp on l.ccompra=cp.ccompra join comunidade c on cp.idc=c.idc join provedor pr on cp.cprovedor=pr.cprovedor
where to_char(v.hsaida,'DD/MM/YYYY')='01/05/2020'

/* Consulta 9*/

select cs.idcen as "ID", cs.nomec as "Centro de saude", c.nome as "Comunidade", count(npeticion) "Numero de peticions"
from centro cs left join solicitude s on cs.idcen=s.idcen join comunidade c on cs.idc=c.idc
group by cs.idcen, cs.nomec, c.nome
order by cs.idcen

/* Consulta 10*/

select s.dpeticion as "Data da peticion", p.nomep as "Producto", ls.csolicitada as "Cantidade solicitada"
from centro cs join solicitude s on cs.idcen=s.idcen join lineasolicitude ls on s.npeticion=ls.npeticion join producto p on ls.cproducto=p.cproducto
where cs.idcen=2

/* Consulta 11*/

select p.nomep, c.nome, d.nomedis, pp.casignada
from producto p join lineacompra l on p.cproducto=l.cproducto join pasapor pp on l.ccompra=pp.ccompra and l.nlineac=pp.nlineac join centrodistr d on pp.idcdis=d.idcdis join comunidade c on d.idc=c.idc join descarga ds on l.ccompra=ds.ccompra and l.nlineac=ds.nlineac join voo v on ds.cvoo=v.cvoo
where to_char(hsaida,'DD/MM/YYYY')='01/05/2020'

/* Consulta 12*/

select r.nomeruta as "Ruta", to_char(pp.hparada,'DD/MM/YYYY HH24:MI:SS') as "Hora parada", c.nome as "Comunidade", cd.nomedis as "Centro de distribucion"
from ruta r join viaxe v on r.cruta=v.cruta join pasapor pp on v.cruta=pp.cruta and v.horasaida=pp.horasaida join centrodistr cd on pp.idcdis=cd.idcdis join comunidade c on cd.idc=c.idc
where to_date('01/05/2020 00:00:00','DD/MM/YYYY HH24:MI:SS') < v.horasaida

/* Consulta 13*/

select cd.idcdis as "ID", cd.nomedis as "Nome", c.nome as "Comunidade", pp.cruta as "Ruta", to_char(pp.hparada,'DD/MM/YYYY') as "Dia"
from centrodistr cd join comunidade c on cd.idc=c.idc join pasapor pp on cd.idcdis=pp.idcdis

/* Consulta 14*/

select c.nomecond as "Conductor", cm.matricula as "Matricula", cm.marca as "Marca"
from viaxe v join conductor c on c.carnet=v.carnet join camion cm on cm.matricula=v.matricula
where v.cruta=4 and v.horasaida=to_date('01/05/2020 06:00:00','DD/MM/YYYY HH24:MI:SS')

/* Consulta 15*/

select p.nomep as "Producto", vo.cvoo as "Voo"
from viaxe v join descarga d on v.cruta=d.cruta and v.horasaida=d.horasaida join voo vo on d.cvoo=vo.cvoo join lineacompra l on l.ccompra=d.ccompra and d.nlineac=l.nlineac join producto p on p.cproducto=l.cproducto
where v.cruta=4 and v.horasaida=to_date('01/05/2020 06:00:00','DD/MM/YYYY HH24:MI:SS')

/* Consulta 16*/

select p.nomep as "Producto", d.ctransportada as "Cantidade transportada"
from viaxe v join descarga d on v.cruta=d.cruta and v.horasaida=d.horasaida join lineacompra l on l.ccompra=d.ccompra and d.nlineac=l.nlineac join producto p on p.cproducto=l.cproducto
where v.cruta=4 and v.horasaida=to_date('01/05/2020 06:00:00','DD/MM/YYYY HH24:MI:SS')

/* Consulta 17*/

select p.nomep as "Producto", to_char(pp.hparada,'DD/MM/YYYY') as "Data entrega", pp.casignada as "Cantidade entregada", cd.nomedis as "Centro"
from producto p join lineacompra l on p.cproducto=l.cproducto join pasapor pp on l.ccompra=pp.ccompra and l.nlineac=pp.nlineac join centrodistr cd on pp.idcdis=cd.idcdis join viaxe v on pp.cruta=v.cruta and pp.horasaida=v.horasaida
where v.cruta=4 and v.horasaida=to_date('01/05/2020 06:00:00','DD/MM/YYYY HH24:MI:SS')

/*

 Consultas de tema Libre

*/

/* Consulta 18*/

select c.nome "Comunidade", cs.nomec "Centro", count(p.cproducto) as "Productos solicitados"
from centro cs left join solicitude s on cs.idcen=s.idcen join lineasolicitude l on s.npeticion=l.npeticion join producto p on l.cproducto=p.cproducto join comunidade c on cs.idc=c.idc
group by c.nome, cs.nomec

/* Consulta 19*/

select p.nomep as "Producto", l.ccomprada as "Cantidade Comprada", (select avg(ccomprada) from lineacompra) as "Media"
from producto p join lineacompra l on p.cproducto=l.cproducto
where l.ccomprada > (select avg(ccomprada) from lineacompra)

/* Consulta 20*/

select c.nome as "Comunidade", l.ccompra as "Codigo da compra", p.nomep as "Producto", l.ccomprada as "Cantidade comprada"
from comunidade c join compra cp on c.idc=cp.idc join lineacompra l on cp.ccompra=l.ccompra join producto p on l.cproducto=p.cproducto
where (l.ccompra,l.ccomprada) = some (select ccompra, max(ccomprada) from lineacompra group by ccompra)