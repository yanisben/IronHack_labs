use publications;
# Challenge 1 - Most Profiting Authors

-- Step1
select t.title_id, ta.au_id, ((t.advance * ta.royaltyper)/100) as advance, (((t.price * s.qty * t.royalty)/100) * (ta.royaltyper / 100)) as royalty
from titleauthor ta
join titles t
on ta.title_id = t.title_id
join sales s
on t.title_id = s.title_id;

-- Step 2
select title_id, au_id, sum(royalty)
from (
	select t.title_id, ta.au_id, ((t.advance * ta.royaltyper)/100) as advance, (((t.price * s.qty * t.royalty)/100) * (ta.royaltyper / 100)) as royalty
	from titleauthor ta
	join titles t
	on ta.title_id = t.title_id
	join sales s
	on t.title_id = s.title_id) as sub
group by title_id, au_id;

-- Step 3
select r.au_id, sum(r.advance + r.royalty) as profits
from (
	select t.title_id, ta.au_id, ((t.advance * ta.royaltyper)/100) as advance, (((t.price * s.qty * t.royalty)/100) * (ta.royaltyper / 100)) as royalty
	from titleauthor ta
	join titles t
	on ta.title_id = t.title_id
	join sales s
	on t.title_id = s.title_id) as r
join (
	select title_id, au_id, sum(royalty)
	from (
		select t.title_id, ta.au_id, ((t.advance * ta.royaltyper)/100) as advance, (((t.price * s.qty * t.royalty)/100) * (ta.royaltyper / 100)) as royalty
		from titleauthor ta
		join titles t
		on ta.title_id = t.title_id
		join sales s
		on t.title_id = s.title_id) as sub
	group by title_id, au_id) as s
on r.title_id = s.title_id
group by au_id;

# Challenge 2 - Alternative solution

create temporary table royalties_advance
select t.title_id, ta.au_id, ((t.advance * ta.royaltyper)/100) as advance, (((t.price * s.qty * t.royalty)/100) * (ta.royaltyper / 100)) as royalty
from titleauthor ta
join titles t
on ta.title_id = t.title_id
join sales s
on t.title_id = s.title_id;

create temporary table auth_royal
select title_id, au_id, sum(royalty)
from royalties_advance as sub
group by title_id, au_id;

select ra.au_id, sum(advance + royalty) as profits
from royalties_advance ra
join auth_royal as ar
on ra.title_id = ar.title_id
group by ra.au_id;

# Challenge 3

create table if not exists publications.most_profiting_authors(au_id varchar(255), profits varchar(255));
insert into most_profiting_authors(au_id, profits)
select au_id, profits
from (select ra.au_id, sum(advance + royalty) as profits
from royalties_advance ra
join auth_royal as ar
on ra.title_id = ar.title_id
group by ra.au_id) as auth_profits
group by au_id
order by profits desc
limit 5;

select * from most_profiting_authors