'Q1: Who is the Senior most Employee Based on the Job Title? '
select * from employee
order by levels desc
limit 1;


'Q2 Which Country have the most invoices?'
select * from invoice;
select billing_country, count(invoice_id)  from invoice
group by billing_country order by count(invoice_id) desc
limit 1;


'Q3 What are Top 3 values of Total invoice'
select * from invoice
order by total desc
limit 3;


'Q4 Which city has the best customers? We would like to throw a promotional Music 
Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals'
select billing_city, sum(total) from invoice
group by billing_city order by sum(total) desc
limit 1;


'Q5: Who is the best customer? The customer who has spent the most money will be
declared the best customer. 
Write a query that returns the person who has spent the most money.'
select c.customer_id, c.first_name , sum(i.total) as Total
from customer as c inner join invoice as i
on c.customer_id = i.customer_id
group by c.customer_id
order by Total desc
limit 1;

'Med'

'Q6: Write query to return the email, first name, last name, & Genre of all
     Rock Music listeners.Return your list ordered alphabetically by email 
	 starting with A.'
select distinct (c.email), c.first_name, c.last_name  from customer as c
join invoice as i on c.customer_id = i.customer_id
join invoice_line as il on i.invoice_id = il.invoice_id
where track_id in(
					select t.track_id from track as t join genre as g
					on t.genre_id = g.genre_id where g.name like 'Rock')
order by email;


'Q6: Lets invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of 
the top 10 rock bands.'
select a.artist_id, a.name, count(t.track_id)as Total_track from artist as a
join album as al on a.artist_id = al.artist_id
join track as t on al.album_id = t.album_id
join genre as g on t.genre_id = g.genre_id
where g.name ='Rock'
group by a.artist_id
order by Total_track desc
limit 10;


' Q7: Return all the track names that have a song length longer than the average 
      song length.Return the Name and Milliseconds for each track. Order by the song 
	  length with the longest songs listed first.'
select name, milliseconds as Time from track
where milliseconds >(select avg(milliseconds) from track)
order by Time desc;



	






























