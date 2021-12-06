# Bases de Datos – Traballo tutelado E/R

### Curso académico 2019/2020

## Exercicio de loxística

Para o desarrollo do dominio, necesitamos saber as compras de material para cubrir as
necesidades dos centros. O goberno será o encargado desa xestión do material, ademáis do
transporte. Para levar a conta de todo iso, precisa unha base de datos.


## Material entregado

Co traballo entregouse un script en formato de texto simple (create_tables.sql.txt) que contén a
definición das táboas, os insert, e os alter. Entréganse tamén o diagrama ER e MR, ademáis de
un script coas consultas (consultas.sql.txt) e un script adicional por se fose necesario para borrar
as táboas (delete_tables.sql). Para visualizar o vídeo, clickee aquí.

## Descripción da base de datos

Neste documento indícanse os detalles que poderían ser ambiguos ou xenéricos dende o punto
de vista do usuario do sistema:
* Unha compra pode ser de varios productos e só pode facerse a un único provedor.
* Unha solicitude pode ser de varios productos con cantidades distintas.
* Se supón que unha compra de un único producto (por exemplo 4000 mascarillas) pódese descompoñer en varias entregas.
* Los atributos de vuelo loc. saída e loc. chegada fan referencia a localidade donde aterriza o avión e por iso figuran como atributos e non como unha relación a comunidade.
* O campo de dentrega da táboa Entrega (data da entrega) fai é unha estimación da data na que se van entregar os productos.
* A táboa de Descarga serve para enlazar os productos que se distribuíron nos viaxes seleccionados de cada voo. O atributo ctransportada fai referencia a cantidade transportada de cada producto no voo.
* A táboa de Pasapor serve para enlazar un viaxe co centro polos que pasa e a cantidade de producto que deixa en cada centro (casignada).
