Challenge 1

SELECT
authors.au_id as Author_ID, 
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as Sales_royalty,
titles.title_id as Title_ID


FROM
authors

LEFT JOIN titleauthor 
on authors.au_id = titleauthor.au_id
LEFT JOIN titles
on titleauthor.title_id = titles.title_id
LEFT JOIN sales
on titles.title_id = sales.title_id
group by author_id, title_id
order by Sales_royalty DESC
limit 3

Challenge 2 (Alt Solv.)

create temporary table publications.chall_table
SELECT
authors.au_id as Author_ID, 
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as Sales_royalty,
titles.title_id as Title_ID


FROM
authors

LEFT JOIN titleauthor 
on authors.au_id = titleauthor.au_id
LEFT JOIN titles
on titleauthor.title_id = titles.title_id
LEFT JOIN sales
on titles.title_id = sales.title_id
group by author_id, title_id
order by Sales_royalty DESC
limit 3

------ en otra query

select *
from publications.chall_table


Challenge 3

CREATE TABLE challenge3 AS
    SELECT Author_ID as au_id, Sales_royalty as profits
    FROM chall_table