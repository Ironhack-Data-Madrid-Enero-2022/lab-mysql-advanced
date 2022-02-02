--------
-- Challenge 1
--------
select titleauthor.au_id as Author_id, 
    ROUND(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100, 2) as sales_royalty
	from authors
		left join titleauthor 
			on titleauthor.au_id= authors.au_id
		left join sales
			on titleauthor.title_id = sales.title_id 
		left join titles
			on titles.title_id = sales.title_id
group by author_id
order by sales_royalty desc
limit 3;

--------
-- Challenge 2
--------
-- DROP TABLE IF EXISTS `author_royalties` ;
create temporary table Publications_lab.author_royalties
	select Author_id, sales_royalty
    from
(select titleauthor.au_id as Author_id,
	titles.title_id as title_id,
    ROUND(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100, 2) as sales_royalty
	from authors
		left join titleauthor 
			on titleauthor.au_id= authors.au_id
		left join sales
			on titleauthor.title_id = sales.title_id 
		left join titles
			on titles.title_id = sales.title_id
group by author_id
order by sales_royalty desc) royalty;

-- Challenge 3

create table most_profiting_authors
select Author_id, sales_royalty
FROM author_royalties



