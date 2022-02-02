-- CHALLENGE 1

-- Step 1

select titleauthor.title_id,
au_id,
titles.price * sales.qty * (titles.royalty / 100) * (titleauthor.royaltyper / 100) as sales_royalty

from titleauthor

left join titles
on titleauthor.title_id = titles.title_id

left join sales
on titleauthor.title_id = sales.title_id


-- Step 2

select titleauthor.title_id,
au_id,
sum(titles.price * sales.qty * (titles.royalty / 100) * (titleauthor.royaltyper / 100)) as title_royalty

from titleauthor

left join titles
on titleauthor.title_id = titles.title_id

left join sales
on titleauthor.title_id = sales.title_id

group by au_id, title_id

order by title_royalty desc


-- Step 3

select title_id,
au_id, sum(sales_royalty) as "Total Royalty"

from
(select titleauthor.title_id,
au_id,
sum(titles.price * sales.qty * (titles.royalty / 100) * (titleauthor.royaltyper / 100)) as sales_royalty

from titleauthor

left join titles
on titleauthor.title_id = titles.title_id

left join sales
on titleauthor.title_id = sales.title_id

group by au_id, title_id) as title_royalties

group by au_id

order by sum(sales_royalty) desc

limit 3




-- CHALLENGE 2

create temporary table publications.titles_royalties

select titleauthor.title_id,
au_id,
sum(titles.price * sales.qty * (titles.royalty / 100) * (titleauthor.royaltyper / 100)) as sales_royalty

from titleauthor

left join titles
on titleauthor.title_id = titles.title_id

left join sales
on titleauthor.title_id = sales.title_id

group by au_id, title_id;

select title_id,
au_id, sum(sales_royalty) as "Total Royalty"

from publications.titles_royalties

group by au_id

order by sum(sales_royalty) desc

limit 3




-- CHALLENGE 3

create table publications.top_authors (select
au_id, 
sum(sales_royalty) as "profits"

from
(select titleauthor.title_id,
au_id,
sum(titles.price * sales.qty * (titles.royalty / 100) * (titleauthor.royaltyper / 100)) as sales_royalty

from titleauthor

left join titles
on titleauthor.title_id = titles.title_id

left join sales
on titleauthor.title_id = sales.title_id

group by au_id, title_id) as title_royalties

group by au_id

order by sum(sales_royalty) desc

limit 3);
