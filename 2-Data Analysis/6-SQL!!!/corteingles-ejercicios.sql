## 2. Genera una consulta que obtenga la lista ordenada de todas las referencias sin venta
SELECT distinct *
FROM articulo a
LEFT JOIN venta v
on a.referencia = v.referencia
where v.referencia is null;

## 3. Genera una consulta que obtenga las ventas comprendidas entre 2010 y 2011 (ambos incluidos),
# que estén asociados a una campaña de tipo VENTA y que sean del departamento de JOYERÍA.

SELECT  *
FROM venta v, campanias c, departamento d 
where year(FECHA_VENTA) in ('2010','2011')  and c.tipo = 'VENTA' and d.DESC_DPTO = 'JOYERIA';

## 4. Genere una consulta que cree un campo "co_ranking" que clasifique en orden ascendente
 ##las campañas según el total de venta, siendo 1 la campaña que más ha vendido y N la que menos. 
 ##(N = Total de campañas)

SELECT de.ID_CAMPANIA, sum(precio),rank() over (order by sum(precio) desc) as co_ranking
from venta v
left join articulo a
on v.referencia = a.referencia
left join depto_campania as de
on a.ID_DPTO = de.ID_DPTO
left join campanias c
on de.ID_CAMPANIA = c.ID_CAMPANIA
group by ID_CAMPANIA;


#### 5. Clasifique todas las ventas en Mayor, Igual o Menor precio 
### respecto a la media de los precios de todas las ventas realizadas.

#PLANTEAMINETO 1
SELECT v.TALON,v.PRECIO, AVG(V.PRECIO) OVER (ORDER BY 'MAYOR' or 'MENOR' DESC) AS CLASIFICACION
FROM VENTA V
where v.precio > avg(v.precio) = 'MAYOR' AND v.precio < avg(v.precio) = 'MENOR';

#PLANTEAMIENTO 2

select V.precio, V.talon, avg(v.precio) as media,
		(CASE
			when 50.98 > PRECIO THEN 'MENOR'
            when 50.98 < PRECIO THEN 'MAYOR'
            ELSE 'IGUAL' END)
            AS CLASIFICACION
FROM VENTA v
group by precio
order by precio desc;

#PLANTEAMIENTO 3
SELECT v.*,
		(CASE WHEN (select avg(v1.precio) as media FROM VENTA v1) > v.precio THEN "Menor"
				WHEN (select avg(v1.precio) as media FROM VENTA v1) = v.precio THEN "Igual"
				ELSE "Mayor" END) AS gt_avg
FROM VENTA v;

### 7. Genere una consulta que para cada campaña de tipo "venta" obtenga el talón medio, precio medio,
### nº de referencias compradas y nº de talones con venta superior al talón medio.

 select c.id_campania,count(v.referencia) ,avg(v.precio) as 'media Precio'
 from venta v
 left join articulo a
 on v.referencia=a.referencia
 left join depto_campania d
 on d.id_dpto=a.id_dpto
 left join campanias c
 on c.id_campania=d.id_campania
 where c.tipo='VENTA'
 group by c.id_campania
 order by c.id_campania;

## 8. Genere una o varias consultas que devulevan las combinaciones de familias y 
##campañas cuya venta haya sido superior a 100€.








 	

 