/* EJERCICIO CHINOOK SQL*/
SELECT distinct Country
from CHINOOK.customer; 


/* 1 muestra clientes de brasil*/
SELECT *
FROM Customer
WHERE Country = 'Brazil';

/* 2 muestra los empleados que son agentes de venta*/
SELECT DISTINCT Title
FROM employee;


SELECT *
FROM employee
WHERE Title = 'Sales Support Agent';

/* 3 muestra las canciones de ACDC*/
SELECT *
FROM track
WHERE Composer = 'AC/DC';

/* 4 muestra los clientes que no sean de USA*/
select *
from customer
WHERE Country != 'USA';

/* 5 Nombre completo, Dirección Ciudad, Estado, Pais) y email */

SELECT FirstName, LastName, Address, City,State, Country,Email
from employee
WHERE Title = 'Sales Support Agent';

/*6 Muestra una lista con los paises que aparecen a los que se ha facturado, la lista no 
debe contener paises repetidos* */
SELECT DISTINCT BillingCountry
from invoice;

/*7 Muestra una lista con los estados de USA de donde son los clientes, la lista no debe 
contener estados repetidos*/
SELECT distinct State
FROM customer
where country = 'USA';

/*8 Cuantos articulos tiene la factura 37*/
SELECT *
FROM invoiceline
WHERE InvoiceId = '37';

/*9  CANCIONES DE ACDC*/
SELECT *
FROM track
WHERE Composer = 'AC/DC';

/*10  Cuantos articulos tiene cada factura*/
SELECT Quantity, count(InvoiceId)
FROM invoiceline
group by Quantity;

/*11  Muestrame cuantos facturas hay de cada pais*/
SELECT BillingCountry,count(InvoiceId)
FROM invoice
GROUP BY BillingCountry;



/*12   Cuantas facturas ha habido en 2009 y 2011*/
select InvoiceDate
from invoice
where YEAR(InvoiceDate)  = 2009 OR YEAR(InvoiceDate)= 2011;

/*13 Cuantas facturas ha habido entre 2009 y 2011*/
SELECT InvoiceDate
From invoice
where YEAR(InvoiceDate) between 2009 and 2011;

/*14 Cuantos clientes hay de españa y de Brazil*/
SELECT Country,count(CustomerId)
FROM customer
WHERE Country = 'Spain' or COUNTRY ='Brazil'
group by Country;

/*15 Muestrame las canciones que su titulo empieza por ‘You’*/
SELECT Name
FROM track
 where Name like 'you%';
 
/*SEGUNDA PARTE*/ 

/*1 Facturas de Clientes de Brasil, Nombre del cliente, Id de factura, fecha de la factura 
y el pais de la factura*/

SELECT customer.customerId, customer.LastName,customer.FirstName, customer.Country,invoice.InvoiceId,invoice.InvoiceDate
FROM customer
LEFT JOIN invoice
ON customer.customerid = invoice.Customerid
WHERE Country = 'Brazil';

/*2 Facturas de Clientes de Brasil*/
SELECT BillingCountry,count(InvoiceId)
FROM invoice
WHERE BillingCountry= 'Brazil';

/*3 Muestra cada factura asociada a cada agente de ventas con su nombre completo*/

SELECT employee.EmployeeId,employee.Title,employee.FirstName,employee.LastName,customer.customerid,customer.SupportRepId
from employee
left join customer
on employee.EmployeeId = customer.SupportRepId
left join invoice
on customer.CustomerId = invoice.CustomerId;

/*4 Muestra el nombre del cliente, el pais, el nombre del agente y el total */
SELECT employee.EmployeeId,employee.FirstName,employee.LastName,customer.customerid,customer.Country,invoice.Total,customer.SupportRepId
from employee
left join customer
on employee.EmployeeId = customer.SupportRepId
left join invoice
on invoice.CustomerId = customer.CustomerId;

/*5 Muestra cada articulo de la factura con el nombre de la cancion */
SELECT invoiceline.TrackId, track.TrackId, track.Name, invoiceline.UnitPrice
from invoiceline
left join track
on track.TrackId = invoiceline.TrackId;

/*6 Muestra todas las conciones con su nombre, formato, album y genero */
SELECT track.TrackId, track.Name, track.AlbumId, track.GenreId, genre.GenreId, album.AlbumId,mediatype.MediaTypeId,mediatype.Name
from track
left join genre
on track.GenreId = genre.GenreId
left join mediatype
on mediatype.MediaTypeId = track.MediaTypeId
left join album
on album.AlbumId = track.AlbumId;

/*7 Muestr a cuantas canciones hay en cada playlist y el nombre de cada playlist */
select playlist.PlaylistId, playlist.name, playlisttrack.PlaylistId, playlisttrack.TrackId, track.TrackId
from playlist
left join playlisttrack
on playlisttrack.PlaylistId = playlist.PlaylistId
left join track
on track.TrackId = playlisttrack.TrackId;

/*8 Muestra cuánto ha vendido cada empleado */
SELECT employee.LastName, employee.FirstName, employee.Title, employee.EmployeeId, customer.CustomerId, customer.SupportRepId, invoice.InvoiceId,invoice.Total,invoiceline.Quantity, invoiceline.InvoiceLineId
from employee
left join customer
on employee.EmployeeId = customer.SupportRepId
left join invoice
on customer.CustomerId = invoice.invoiceid
left join invoiceline
on invoice.InvoiceId = invoiceline.InvoiceLineId;

/* 9. Quien ha sido el agente de ventas que más ha vendido en 2009? deberia poner title = sales support agent */

SELECT employee.LastName, employee.FirstName, employee.Title, employee.EmployeeId, customer.CustomerId, customer.SupportRepId, invoice.InvoiceId,invoice.Total,invoiceline.Quantity, invoiceline.InvoiceLineId
from employee
left join customer
on employee.EmployeeId = customer.SupportRepId
left join invoice
on customer.CustomerId = invoice.invoiceid
left join invoiceline
on invoice.InvoiceId = invoiceline.InvoiceLineId;
 
 
/* 10.  Quien es son los 3 grupos que más han vendido? */
SELECT DISTINCT artist.ArtistId, artist.Name, album.AlbumId, track.TrackId, invoiceline.Quantity,invoiceline.InvoiceId
FROM artist
LEFT JOIN album
on artist.ArtistId = album.ArtistId
LEFT JOIN track
on album.AlbumId = track.TrackId
LEFT JOIN invoiceline
on track.TrackId = invoiceline.TrackId;


 

































