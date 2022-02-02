-- DESAFIO 1 / PASO 1 ------------------------------------------------------------------------------
-- VENTAS AGRUPADAS POR TITULO - LOS AUTORES SE REPITEN
select DISTINCT sales.title_id, authors.au_fname, authors.au_lname,titles.title, titles.advance,
	(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty
	from sales
	left join titles 
	on sales.title_id = titles.title_id
	left join titleauthor
	on titles.title_id = titleauthor.title_id
	left join authors
	on authors.au_id = titleauthor.au_id
	group by qty;

-- DESAFIO 1 / PASO 2 ------------------------------------------------------------------------------
-- VENTAS AGRUPADAS POR TITULO MÁS LOS ROYALTIES - LOS AUTORES NO SE REPITEN
select DISTINCT sales.title_id, authors.au_fname, authors.au_lname,titles.title, titles.advance,
	(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty
	from sales
	left join titles 
	on sales.title_id = titles.title_id
	left join titleauthor
	on titles.title_id = titleauthor.title_id
	left join authors
	on authors.au_id = titleauthor.au_id
	group by title;
    
    -- DESAFIO 1 / PASO 3 ------------------------------------------------------------------------------
    -- VENTAS AGRUPADAS POR TITULO MÁS LOS ROYALTIES Y CÁLCULO DE LOS BENEFICIOS
select DISTINCT sales.title_id, authors.au_fname, authors.au_lname,titles.title, titles.advance,
	(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty,
    sum(titles.advance+(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100)) as profits
	from sales
	left join titles 
	on sales.title_id = titles.title_id
	left join titleauthor
	on titles.title_id = titleauthor.title_id
	left join authors
	on authors.au_id = titleauthor.au_id
	group by title;
    
    
    
-- DESAFIO 3 ------------------------------------------------------------------------------
-- NUEVA TABLA PERMANENTE A PARTIR DE LAS QUERIES ANTERIORES %%%%% ___NO FUNCIONA___ %%%%%%%
   
   CREATE TABLE most_profiting_authors (au_id int PRIMARY KEY, profits int);
   
   INSERT INTO most_profiting_authors (au_id, profits)
   VALUES (
			(select DISTINCT au_id from authors ),
			(select DISTINCT sales.title_id,titles.title,titles.advance,   
            sum(titles.advance+(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100)) as profits
			from sales
			left join titles 
			on sales.title_id = titles.title_id
            left join titleauthor
			on titles.title_id = titleauthor.title_id)
   );
