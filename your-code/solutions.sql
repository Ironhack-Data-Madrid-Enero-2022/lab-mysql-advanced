-- Challenge 1

-- Step 1
create temporary table publications.sales_royalties
select titles.title as 'Title_ID',
authors.au_id as 'Author_ID',
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalties,
titles.advance as 'Advance'

from authors

left join titleauthor on authors.au_id = titleauthor.au_id
left join titles on titleauthor.title_id = titles.title_id
left join sales on titles.title_id = sales.title_id

where title is not null

-- Step 2

create temporary table publications.Royalties_pr_Titles
select Title_ID, Author_ID, sum(sales_royalties) as 'Royalties_pr_Titles', Advance
from publications.sales_royalties
group by  Title_ID, Author_ID

-- Step 3

create temporary table publications.Top_3_Profits_Authors
select Author_ID, sum(Royalties_pr_Titles + Advance) as Profits_Authors
from publications.Royalties_pr_Titles
group by  Author_ID
order by Profits_Authors desc
limit 3


-- Challenge 2

select Author_ID, Total + Advance as Profits 

from

 (select 'Title_ID', 'Author_ID', sum('Royalty') as 'Total', 'Advance' 
 
 from
 
 (select authors.au_id as Author_ID, titles.title_id as Title_ID, titles.advance as Advance,
 titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as Royalty
 
 from authors 
 
 left join titleauthor on authors.au_id = titleauthor.au_id
 
 left join titles on titles.title_id = titleauthor.title_id
 
 left join sales on sales.title_id = titles.title_id) Table_1
 
 group by author_id, title_id) Table_2
 
 order by Profits desc
 
 limit 3
 
-- Challenge 3

create table most_profiting_authors
(author_id varchar (12)  primary key not null,profits int (25));
insert into most_profiting_authors (author_id, profits) values ("899-46-2035", 17353.132000000000);
insert into most_profiting_authors (author_id, profits) values ("213-46-8915", 15162.110000000000);
insert into most_profiting_authors (author_id, profits) values ("722-51-5454", 15021.528000000000)

-- end


