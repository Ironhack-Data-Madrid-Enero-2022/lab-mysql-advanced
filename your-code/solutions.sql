-- CHALENGE 1

select AUTHOR_ID, TOTAL + ADVANCE as PROFITS from
(select TITLE_ID, AUTHOR_ID, sum(ROYALTY) as TOTAL, ADVANCE from
(select a.au_id as AUTHOR_ID, titles.title_id as TITLE_ID, titles.advance as ADVANCE, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as ROYALTY
from authors as a
left join titleauthor
on a.au_id = titleauthor.au_id
left join titles
on titles.title_id = titleauthor.title_id
left join sales
on sales.title_id = titles.title_id) TABLA
group by author_id, title_id) TABLA2 
order by PROFITS desc
limit 3


--CHALENGE 2

--creo la tabla temporal 1
create temporary table pub3.temp1
select a.au_id as AUTHOR_ID, titles.title_id as TITLE_ID, titles.advance as ADVANCE, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as ROYALTY
from authors as a
left join titleauthor
on a.au_id = titleauthor.au_id
left join titles
on titles.title_id = titleauthor.title_id
left join sales
on sales.title_id = titles.title_id

--creo la tabla temporal2
create temporary table pub3.temp2
select TITLE_ID, AUTHOR_ID, sum(ROYALTY) as TOTAL, ADVANCE from temp1
group by AUTHOR_ID, TITLE_ID

--ejecuto la última query 
select AUTHOR_ID, TOTAL + ADVANCE as PROFITS from temp2
order by PROFITS desc
limit 3


--CHALENGE 3

CREATE TABLE most_profiting_authors
 (
 author_id varchar (12)  primary key not null,
 profits int (25))
INSERT INTO most_profiting_authors (author_id, profits) values ("722-51-5454", 15021.528000000000)
INSERT INTO most_profiting_authors (author_id, profits) values ("899-46-2035", 15007.176000000000)
INSERT INTO most_profiting_authors (author_id, profits) values ("213-46-8915", 10150.116000000000)

