
-- QUERY FOR THE FIRST CHALLANGE 
select a.au_id as 'Authors ID', SUM(t.price*qty*t.royalty/100*ta.royaltyper/100) as 'SUM Royalty'
                    from authors as a
                    left join titleauthor as ta 
                    on ta.au_id = a.au_id
                    left join titles as t
                    on t.title_id = ta.title_id
                    inner join sales as s 
                    on s.title_id = t.title_id
                    group by a.au_id
                    ;
-- AN ADDITIONAL WAY TO SOLVE IT,
CREATE temporary table Step1Table
select t.title_id as 'Title_ID', a.au_id as 'Authors_ID', (t.price*qty*t.royalty/100*ta.royaltyper/100) as 'Royalty'
from authors as a
left join titleauthor as ta 
on ta.au_id = a.au_id
left join titles as t
on t.title_id = ta.title_id
inner join sales as s 
on s.title_id = t.title_id
;
CREATE temporary table Step2Table
select Title_ID,Authors_ID, SUM(Royalty) 
from Step1Table 
group by Title_ID, Authors_ID
;

select Authors_ID, SUM(Royalty) 
from Step1Table 
group by Authors_ID
;

-- ONE MORE WAY, ADDITIONALLY THIS TIME I AM GOING TO CREATE A TABLE TO WRITE THE DATA 
create table most_profiting_authors 
    select Authors_ID, SUM(Royalty) most_profiting_authors
    from (select Title_ID, Authors_ID, SUM(Royalty)  as 'Royalty'
    from (select t.title_id as 'Title_ID', a.au_id as 'Authors_ID', (t.price*qty*t.royalty/100*ta.royaltyper/100) as 'Royalty'
    from authors as a
    left join titleauthor as ta 
    on ta.au_id = a.au_id
    left join titles as t
    on t.title_id = ta.title_id
    inner join sales as s 
    on s.title_id = t.title_id) myDerivedTable
    group by Title_ID, Authors_ID) mdt
    group by Authors_ID
    ;
   -- select * from most_profiting_authors -- CHECKING THAT IT IS WORKING. 