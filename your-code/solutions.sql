# Challenge 1 step 1

'''SELECT  a.au_id AS "AUTHOR ID",  tl.title AS "Title",
(tl.price * sa.qty * (tl.royalty / 100) * (ta.royaltyper / 100)) AS "royal_sales"
	FROM authors AS a
    LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id  
    LEFT JOIN titles AS tl ON tl.title_id = ta.title_id 
    LEFT JOIN publishers AS pb ON pb.pub_id = tl.pub_id 
    LEFT JOIN sales AS sa ON sa.title_id = ta.title_id
    '''

    -----------------------------------------------------   
    
# Challenge 1 step 2
'''SELECT  a.au_id AS "AUTHOR ID",   tl.title AS "Title",
sum(tl.price * sa.qty * tl.royalty / 100 * ta.royaltyper / 100) AS "royal_sales"
	FROM authors AS a
    LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id  
    LEFT JOIN titles AS tl ON tl.title_id = ta.title_id 
    LEFT JOIN publishers AS pb ON pb.pub_id = tl.pub_id 
    LEFT JOIN sales AS sa ON sa.title_id = ta.title_id 
		GROUP BY tl.title,a.au_id'''

---------------
# Challenge 1 step 3
'''Select * from 

(SELECT  a.au_id AS "AUTHOR_ID",   tl.title AS "Title",
sum(tl.price * sa.qty * tl.royalty / 100 * ta.royaltyper / 100) AS "royal_sales"
	FROM authors AS a
    LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id  
    LEFT JOIN titles AS tl ON tl.title_id = ta.title_id 
    LEFT JOIN publishers AS pb ON pb.pub_id = tl.pub_id 
    LEFT JOIN sales AS sa ON sa.title_id = ta.title_id 
		GROUP BY tl.title) as tabla2
        GROUP BY AUTHOR_ID
        ORDER BY royal_sales DESC
            LIMIT 3
'''
Challenge 2
'''    
select * from 
(SELECT a.au_id AS "AUTHOR_ID", tl.title AS "TITLE",sum(tl.price * sa.qty * (tl.royalty / 100) * (ta.royaltyper / 100)) as SALES_ROYALTY
FROM authors AS a
    LEFT JOIN titleauthor AS ta     ON a.au_id = ta.au_id  
    LEFT JOIN titles AS tl     ON tl.title_id = ta.title_id 
    LEFT JOIN publishers AS pb     ON pb.pub_id = tl.pub_id 
    LEFT JOIN sales AS sa     ON sa.title_id = ta.title_id
    group by tl.title) as TABLA
    group by AUTHOR_ID
	ORDER BY SALES_ROYALTY DESC
    limit 3
'''
Challenge 3

'''  
CREATE temporary table publication.challenge
    SELECT a.au_id AS "AUTHOR ID", tl.title AS "TITLE",
    (tl.price * sa.qty * (tl.royalty / 100) * (ta.royaltyper / 100)) as SALES_ROYALTY
    FROM authors AS a
        LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id  
        LEFT JOIN titles AS tl ON tl.title_id = ta.title_id 
        LEFT JOIN publishers AS pb ON pb.pub_id = tl.pub_id 
        LEFT JOIN sales AS sa ON sa.title_id = ta.title_id
        ORDER BY SALES_ROYALTY DESC'''


Challenge 4

tabla5='''  
CREATE  table publication.challenge3
    SELECT a.au_id AS "AUTHOR ID",
    (tl.price * sa.qty * (tl.royalty / 100) * (ta.royaltyper / 100)) as royal_sales
    FROM authors AS a
        LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id  
        LEFT JOIN titles AS tl ON tl.title_id = ta.title_id 
        LEFT JOIN publishers AS pb ON pb.pub_id = tl.pub_id 
        LEFT JOIN sales AS sa ON sa.title_id = ta.title_id
            ORDER BY royal_sales DESC'''
-------------------