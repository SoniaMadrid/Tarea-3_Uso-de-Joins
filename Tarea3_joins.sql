--Sonia Madrid 
--#6181001
/*
Utilizar la base de datos de ejemplo Super Heroes y realizar las siguientes consultas utilizando los algoritmos de relación (JOINS)
1. Conocer los superpoderes de cada superheroe
2. De cada productor(publisher) mostrar cuantos hombres y mujeres(gender) hay
3. Mostrar todos los colores que componen a cada superheroe
4. Listar los atributos de cada superheroe
5. Mostrar la calificacion de cada superheroe
*/
use superhero

--1.Conocer los superpoderes de cada superheroe.
select s.id, s.superhero_name, sp.power_name from superhero s
inner join hero_power hp on s.id=hp.hero_id
inner join superpower sp on hp.power_id=sp.id

--2.De cada productor(publisher) mostrar cuantos hombres y mujeres(gender) hay.
select *from(
	select p.publisher_name,g.gender, count(p.id) cantidad from superhero s
	inner join publisher p on s.publisher_id=p.id
	inner join gender g on s.gender_id=g.id
	group by p.publisher_name, g.gender
) as datos
PIVOT(
SUM (cantidad)
FOR gender in ([Male],[Female])
) pivot_table

--3.Mostrar todos los colores que componen a cada superheroe.
select s.id, s.superhero_name, s.eye_colour_id, s.hair_colour_id, 
s.skin_colour_id, c.colour from superhero s
inner join colour c on s.id=c.id

--4.Listar los atributos de cada superheroe.
select s.id, s.superhero_name, a.attribute_name from superhero s
inner join hero_attribute ha on s.id=ha.hero_id
inner join attribute a on ha.attribute_id=a.id
order by s.superhero_name asc 

--5.Mostrar la calificacion de cada superheroe
select s.id, s.superhero_name, ha.attribute_value, al.alignment from superhero s
inner join hero_attribute ha on s.id=ha.hero_id
inner join attribute a on ha.attribute_id=a.id
inner join alignment al on s.alignment_id=al.id
