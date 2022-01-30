# Challenge 1

select a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
from publishers p
join titles t
on p.pub_id = t.pub_id
join titleauthor ta
on t.title_id = ta.title_id
join authors a
on ta.au_id = a.au_id;

# Challenge 2

select a.au_lname, a.au_fname, a.au_id, p.pub_name, count(a.au_id)
from publishers p
join titles t
on p.pub_id = t.pub_id
join titleauthor ta
on t.title_id = ta.title_id
join authors a
on ta.au_id = a.au_id
group by p.pub_name, a.au_id
order by au_lname;

# Challenge 3

select a.au_lname, a.au_fname, sum(s.qty) total_sales
from authors a
join titleauthor ta
on a.au_id = ta.au_id
join sales s
on ta.title_id = s.title_id
group by a.au_lname, a.au_fname
order by total_sales desc
limit 3