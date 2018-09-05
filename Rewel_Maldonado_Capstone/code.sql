 /*Question 1 Code*/

 select *
 from survey
 limit 10;

 /* Question 2 & 3 code*/

select question as ‘Question’, count(*) as ‘Number of 
       Responses’
from survey
group by question;

/*Question 4 explanation contained within the presentation*/

/* Question 5 Quiz table code*/

select *
from quiz
limit 5;

/* Question 5 Home Try-On table code*/

select *
from home_try_on
limit 5;

/* Question 5 Purchase table code*/

select *
from purchase
limit 5;


/*Question 6 code*/

select a.user_id, 
       case
       when b.number_of_pairs >= 0 then 'True'
       else 'False'       
       end as 'is_home_try_on',
       b.number_of_pairs,
       case
       when c.price >= 0 then 'True'
       else 'False'
       end as 'is_purchase'
from quiz as a
left join home_try_on as b
	on a.user_id = b.user_id
left join purchase as c
	on a.user_id = c.user_id
limit 10;


/*Question 7 code*/

with purchasing_table as (select a.user_id, 
       case
       when b.number_of_pairs >= 0 then 'True'
       else 'False'       
       end as 'is_home_try_on',
       b.number_of_pairs,
       case
       when c.price >= 0 then 'True'
       else 'False'
       end as 'is_purchase'
from quiz as a
left join home_try_on as b
	on a.user_id = b.user_id
left join purchase as c
	on a.user_id = c.user_id)
select number_of_pairs, 
			 sum(case when is_purchase = 'True' then 1 else 0 			 		 end) as amount_purchased,
       sum(case when is_purchase = 'False' then 1 else			0 end) as amount_not_purchased
from purchasing_table
group by number_of_pairs;
/*having number_of_pairs is not Null;*/


/*Question 8 Code All Below*/


/* Generic code for pulling search results by style quiz answers*/

Select style as ‘Choice’, count(style) as ‘Response Amount’

from quiz
Group by 1;

/*Replace style with any of the following:
	Fit
	Shape
	Color */


/* Sales made by product type/model */

select model_name, product_id, price, count(product_id) as 'Sales'
from purchase
group by product_id
order by Sales desc;


/****************************************** End of Project *********************************************/