# Challenge 1 step 1

'''SELECT  a.au_id AS "AUTHOR ID",  tl.title AS "Title",
tl.price * sa.qty * tl.royalty / 100 * ta.royaltyper / 100 AS "royal_sales",
	FROM authors AS a
    LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id  
    LEFT JOIN titles AS tl ON tl.title_id = ta.title_id 
    LEFT JOIN publishers AS pb ON pb.pub_id = tl.pub_id 
    LEFT JOIN sales AS sa ON sa.title_id = ta.title_id
    
		'''
# Challenge 1 step 2
'''Select * from 
(SELECT  a.au_id AS "AUTHOR ID",  tl.price AS "price",   tl.title AS "Title",
sum(tl.price * sa.qty * tl.royalty / 100 * ta.royaltyper / 100) AS "royal_sales"
	FROM authors AS a
    LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id  
    LEFT JOIN titles AS tl ON tl.title_id = ta.title_id 
    LEFT JOIN publishers AS pb ON pb.pub_id = tl.pub_id 
    LEFT JOIN sales AS sa ON sa.title_id = ta.title_id
     group by a.au_id) as tabla2

group by Title'''

# Challenge 1 step 3
'''Select * from 

(SELECT  a.au_id AS "AUTHOR ID",  tl.price AS "price",   tl.title AS "Title",
sum(tl.price * sa.qty * tl.royalty / 100 * ta.royaltyper / 100) AS "royal_sales"
	FROM authors AS a
    LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id  
    LEFT JOIN titles AS tl ON tl.title_id = ta.title_id 
    LEFT JOIN publishers AS pb ON pb.pub_id = tl.pub_id 
    LEFT JOIN sales AS sa ON sa.title_id = ta.title_id
     group by tl.title) as tabla3
'''
