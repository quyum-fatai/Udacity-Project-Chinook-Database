-- Question 1: How many quantities were sold each year?

SELECT strftime('%Y',invoicedate) Years, SUM(Quantity) 'Quantity Sold'
FROM invoice
JOIN InvoiceLine
ON Invoice.InvoiceId = InvoiceLine.InvoiceId
GROUP BY years
ORDER BY 2 DESC;


-- Question 2: Which month(s) has the highest revenue generated in each year?

WITH ranked_months AS
(SELECT 
strftime('%Y', InvoiceDate) AS sale_year, 
strftime('%m', InvoiceDate) AS sale_month,
SUM(il.Quantity * il.UnitPrice) AS total_revenue,
RANK() OVER (PARTITION BY strftime('%Y', InvoiceDate) ORDER BY SUM(il.Quantity * il.UnitPrice) DESC) AS rank_within_year
FROM InvoiceLine il
JOIN Invoice i ON i.InvoiceId = il.InvoiceId
GROUP BY sale_year, sale_month
)

SELECT
sale_year,
CASE WHEN sale_month = '01' THEN 'January'
WHEN sale_month = '02' THEN 'February'
WHEN sale_month = '03' THEN 'March'
WHEN sale_month = '04' THEN 'April'
WHEN sale_month = '05' THEN 'May'
WHEN sale_month = '06' THEN 'June'
WHEN sale_month = '07' THEN 'July'
WHEN sale_month = '08' THEN 'August'
WHEN sale_month = '09' THEN 'September'
WHEN sale_month = '10' THEN 'October'
WHEN sale_month = '11' THEN 'November'
ELSE 'December' END AS months,
total_revenue
FROM ranked_months
WHERE rank_within_year = 1
ORDER BY sale_year;


-- Question 3: What are the top 10 selling tracks based on the revenue generated? Show their Unit sold as well

SELECT t.Name, SUM(i.UnitPrice * i.Quantity) Revenue, COUNT(i.Quantity) 'Unit Sold'
FROM Track t
JOIN InvoiceLine i
ON t.TrackId = i.TrackId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;


-- Question 4: How many artists write the top 3 expensive genres (based on unit price) in each country?

WITH Top3_expensive_genre AS
(SELECT g.Name, il.UnitPrice, at.ArtistId
FROM Genre g
JOIN Track t ON g.GenreId = t.GenreId
JOIN Album alb ON alb.AlbumId = t.AlbumId
JOIN Artist at ON at.ArtistId = alb.ArtistId
JOIN InvoiceLine il ON t.TrackId = il.TrackId  
GROUP BY 1,2,3 
ORDER BY il.UnitPrice DESC
LIMIT 3
)

SELECT COUNT(*) num_artist, g.Name 'Genre', BillingCountry 'Country'
FROM Artist a
JOIN Top3_expensive_genre ON a.ArtistId = Top3_expensive_genre.ArtistId
JOIN Album ab ON a.ArtistId = ab.ArtistId
JOIN Track t ON ab.AlbumId = t.AlbumId
JOIN Genre g ON g.GenreId = t.GenreId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
JOIN Invoice i ON i.InvoiceId = il.InvoiceId 
GROUP BY 2, 3
ORDER BY 1 DESC;

